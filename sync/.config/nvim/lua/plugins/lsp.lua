local opts = {}
if vim.fn.has('win64') == 1 then
  opts.ensure_installed = require('config.lsp').get_lsp_servers()
end

return {
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
}
