--
-- lsp
--

local M = {}

---@return string[]
function M.get_lsp_servers()
  local config_dir = vim.fn.stdpath("config")
  local lsp_dir = vim.fs.joinpath(config_dir, "after/lsp")
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

local function lsp_attach(args)
  local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

  -- disable semantic highlights
  client.server_capabilities.semanticTokensProvider = nil

  if client.name == 'ruff' then
    -- conflicts ruff and pyright
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.completionProvider = nil
  end

  if client.name == "clangd" then
    vim.keymap.set("n", "<C-h>", function()
      vim.cmd "LspClangdSwitchSourceHeader"
    end, { noremap = true })
  end

  -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
  if client:supports_method('textDocument/completion') and client.name ~= 'ruff' then
    -- Optional: trigger autocompletion on EVERY keypress. May be slow!
    -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
    client.server_capabilities.completionProvider.triggerCharacters = { '.' }
    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
  end

  -- formatter
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format { timeout_ms = 2000 }
  end, { noremap = true })

  -- https://blog.devoc.ninja/2025/nvim-v0-11-0-language-server-feature/
  -- Set Keymaps
  local keyopts = { remap = true, silent = true }
  if client:supports_method('textDocument/implementation') then
    vim.keymap.set('n', 'gD', vim.lsp.buf.implementation, keyopts)
  end
  if client:supports_method('textDocument/definition') then
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keyopts)
  end
  if client:supports_method('textDocument/typeDefinition') then
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, keyopts)
  end
  if client:supports_method('textDocument/references') then
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, keyopts)
  end
  if client:supports_method('textDocument/rename') then
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename, keyopts)
  end
  if client:supports_method('textDocument/codeAction') then
    vim.keymap.set('n', '<Leader>k', vim.lsp.buf.code_action, keyopts)
  end
  if client:supports_method('textDocument/signatureHelp') then
    vim.api.nvim_create_autocmd('CursorHoldI', {
      pattern = '*',
      callback = function()
        vim.lsp.buf.signature_help({ focus = false, silent = true })
      end
    })
  end

  -- Auto-format ("lint") on save.
  -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
  -- if not client:supports_method('textDocument/willSaveWaitUntil')
  --     and client:supports_method('textDocument/formatting') then
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
  --     buffer = args.buf,
  --     callback = function()
  --       vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
  --     end,
  --   })
  -- end
end

function M.setup()
  local lsp_servers = M.get_lsp_servers()
  vim.lsp.enable(lsp_servers)

  vim.opt.completeopt = { "menuone", "popup", "fuzzy", "preview",
    -- "noselect"
    "noinsert"
  }
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = lsp_attach,
  })
end

return M
