-- https://qiita.com/uhooi/items/99aeff822d4870a8e269
local lsp_names = function()
  local clients = {}
  for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
    if client.name == "null-ls" then
      local sources = {}
      for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
        table.insert(sources, source.name)
      end
      table.insert(clients, "null-ls(" .. table.concat(sources, ", ") .. ")")
    else
      table.insert(clients, client.name)
    end
  end
  return " " .. table.concat(clients, ", ")
end

-- https://qiita.com/Liquid-system/items/b95e8aec02c6b0de4235
local function lsp_name()
  local msg = "No Active"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
      return client.name
    end
  end
  return msg
end

local skk_mode_map = {
  hira = "あ",
  kata = "ア",
  ascii = "aA",
  zenkaku = "全",
  hankata = "ｧｱ",
  abbrev = "aあ",
}
local function mode_name()
  local mode = skk_mode_map[vim.api.nvim_get_var "skkeleton#mode"]
  local name = skk_mode_map[mode]
  if name then
    return name
  end
  return mode
end

local function skk_mode()
  local m = mode_name()
  if m then
    return m
  else
    return ""
  end
end

local function makeprg()
  if #vim.bo.makeprg > 0 then
    return 'vim.bo:' .. vim.bo.makeprg
  end
  if #vim.o.makeprg > 0 then
    return 'vim.o:' .. vim.o.makeprg
  end
  return 'no makeprg'
end

function setup()
  -- local function qf()
  --   if vim.api.nvim_buf_get_option(0, "filetype") == "qf" then
  --     local l = vim.fn.getqflist()
  --     if #l > 0 then
  --       return "quickfix: " .. #l
  --     end
  --   end
  -- end

  ---@diagnostic disable-next-line
  require("lualine").setup {
    options = {
      globalstatus = true,
      disabled_filetypes = { -- Filetypes to disable lualine for.
        statusline = {},     -- only ignores the ft for statusline.
        winbar = { "qf" },   -- only ignores the ft for winbar.
      },
    },
    extensions = {
      "fugitive",
      "quickfix",
    },
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 500,
    },
    -- tabline = {
    --   lualine_a = { "buffers" },
    --   -- lualine_b = { "branch" },
    --   -- lualine_c = { "filename" },
    --   -- lualine_x = {},
    --   -- lualine_y = {},
    --   lualine_z = { "tabs" },
    -- },
    winbar = {
      lualine_a = {
        --   { "filename", path = 1 },
        "location",
        -- "progress",
      },
      lualine_b = {
        "aerial",
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        -- "diff",
      },
      lualine_z = {
      },
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    sections = {
      -- lualine_a = { "branch" },
      lualine_a = { "mode" },
      lualine_b = {
        makeprg,
        -- skk_mode
      },
      lualine_c = {
        -- "diagnostics",
        {
          'filename',
          path = 1,
        }
      },
      lualine_x = {
        lsp_names,
      },
      lualine_y = {
        "filetype",
        "encoding",
        "fileformat",
      },
      lualine_z = {
        -- "mode",
      },
    },
  }
end

local M = {
  { "petertriho/nvim-scrollbar", opts = {} },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   setup = function()
  --     require('bufferline').setup {}
  --   end,
  -- },
  -- { "tiagovla/scope.nvim", config = true },
  -- {
  --   "backdround/tabscope.nvim",
  --   opts = {},
  -- },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      'akinsho/bufferline.nvim',
    },
    -- init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = false,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      setup()
    end,
  },
}

return M
