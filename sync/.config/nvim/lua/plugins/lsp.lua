local opts = {}
if vim.fn.has('win64') == 1 then
  -- opts.ensure_installed = require('config.lsp').get_lsp_servers()
end

---@type LazySpec[]
local config = {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = opts,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
        },
      })
    end,
  },
  -- {
  --   'folke/lazydev.nvim',
  --   ft = 'lua',
  --   dependencies = {
  --     {
  --       'DrKJeff16/wezterm-types',
  --       lazy = true,
  --       version = false,   -- Get the latest version
  --     },
  --   },
  --   opts = {
  --     library = {
  --       -- Other library configs...
  --       { path = 'wezterm-types', mods = { 'wezterm' } },
  --     },
  --   },
  -- },
  {
    'DrKJeff16/wezterm-types',
    -- lazy = true,
    version = false, -- Get the latest version
  },
}

return config
