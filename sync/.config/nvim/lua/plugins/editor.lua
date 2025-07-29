---@type LazySpec[]
local config = {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.lualine").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        mappings = {
          basic = false,
          extra = false,
        },
      }

      -- Toggle current line (linewise) using C-/
      vim.keymap.set("n", "<C-_>", require("Comment.api").toggle.linewise.current)
      vim.keymap.set("n", "<C-/>", require("Comment.api").toggle.linewise.current)

      -- Toggle selection (linewise)
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      local function vcomment()
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.linewise(vim.fn.visualmode())
      end

      vim.keymap.set("x", "<C-_>", vcomment)
      vim.keymap.set("x", "<C-/>", vcomment)

      -- vala lang
      local ft = require "Comment.ft"
      ft.vala = { "//%s", "/*%s*/" }
    end,
  },
  {
    "haya14busa/vim-edgemotion",
    keys = {
      { "<C-j>", "<Plug>(edgemotion-j)", mode = { "n", "v" } },
      { "<C-k>", "<Plug>(edgemotion-k)", mode = { "n", "v" } },
    },
  },
}

return config
