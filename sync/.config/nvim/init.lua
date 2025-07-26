require("config.lazy")

vim.api.nvim_create_user_command("Here", ":!start %:p:h", {})

--
-- options
--
vim.opt.belloff = "all"
vim.opt.hidden = true
vim.opt.swapfile = false

-- visual
vim.opt.winborder = "rounded"
vim.opt.visualbell = false
vim.opt.splitkeep = "screen"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = {
  eol = "$",
  tab = ">-",
  trail = "~",
  extends = ">",
  precedes = "<",
  conceal = "_",
}
-- vim.cmd[[set iskeyword-=_]]
vim.opt.splitkeep = "screen"

vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.showtabline = 0
-- vim.opt.laststatus = 3
vim.opt.laststatus = 2
-- vim.opt.cmdheight = 0
vim.opt.number = false

-- for tmux
vim.opt.termguicolors = true -- Enable colors in terminal

-- buffer
vim.opt.fileformats = { "unix", "dos" }

--
-- clipboard
--
vim.o.clipboard = "unnamedplus"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

--
-- keyap
--
local function write_buffer()
  if vim.startswith(vim.fn.mode(), "i") then
    vim.cmd "stopinsert"
  end
  -- vim.lsp.buf.format { async = false }
  vim.api.nvim_command "write"
end
vim.keymap.set({ "n", "i" }, "<C-s>", write_buffer, { noremap = true })
vim.keymap.set("n", "<C-d>", ":qa<CR>", { noremap = true })


local function get_lsp_servers()
  local config_dir = vim.fn.stdpath("config")
  local lsp_dir = vim.fs.joinpath(config_dir, "lsp")
  local dir = vim.uv.fs_opendir(lsp_dir)
  ---@type string[]
  local lsp_servers = {}
  if dir then
    while true do
      local items = vim.uv.fs_readdir(dir)
      if not items then
        break
      end
      local item = items[1]
      if item and (item.type == 'file' or item.type == 'link') and vim.endswith(item.name, ".lua") then
        table.insert(lsp_servers, item.name.sub(item.name, 1, #item.name - 4))
      end
    end
    vim.uv.fs_closedir(dir)
  end
  return lsp_servers
end

--
-- lsp
--
local lsp_servers = get_lsp_servers()
vim.lsp.enable(lsp_servers)

vim.opt.completeopt = { "menuone", "popup", "fuzzy", "preview",
  -- "noselect"
  "noinsert"
}
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client.name == 'ruff' then
      -- conflicts ruff and pyright
      client.server_capabilities.hoverProvider = false
      client.server_capabilities.completionProvider = nil
    end

    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
    end
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') and client.name ~= 'ruff' then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = { '.' }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    -- formatter
    vim.keymap.set("n", "<Space>f", function()
      vim.lsp.buf.format { timeout_ms = 2000 }
    end, { noremap = true })

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- vim.diagnostic.config {
--   severity_sort = true,
--   float = {
--     border = 'single',
--     title = 'Diagnostics',
--     header = {},
--     suffix = {},
--     format = function(diag)
--       if diag.code then
--         return string.format('[%s](%s): %s', diag.source, diag.code, diag.message)
--       else
--         return string.format('[%s]: %s', diag.source, diag.message)
--       end
--     end,
--   },
-- }
