---@type LazySpec[]
return {
  -- fzf
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("fzf-lua").setup()

      -- vim.keymap.set("n", "<space>g", "<cmd>FzfLua live_grep<CR>", { noremap = true })
      vim.keymap.set("n", "<space>g", "<cmd>FzfLua grep_cword<CR>", { noremap = true })
      vim.keymap.set("n", "<space>b", "<cmd>FzfLua buffers<CR>", { noremap = true })
      -- vim.keymap.set("n", "<space>f", "<cmd>FzfLua files<CR>", { noremap = true })
      vim.keymap.set("n", "<space>l", "<cmd>FzfLua live_grep<CR>", { noremap = true })
    end
  },
  {
    'https://gitlab.com/itaranto/id3.nvim',
    version = '*',
    config = function()
      require('id3').setup {
        mp3_tool = 'id3lib',
      }
    end,
  },
  -- yazi
  {
    "rolv-apneseth/tfm.nvim",
    config = function()
      -- Set keymap so you can open the default terminal file manager (yazi)
      vim.api.nvim_set_keymap("n", "<C-e>", "", {
        noremap = true,
        callback = require("tfm").open,
      })
    end,
  },
  -- {
  --   "mikavilpas/yazi.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim", lazy = true },
  --   },
  --   keys = {
  --     -- 👇 in this section, choose your own keymappings!
  --     {
  --       "<C-e>",
  --       mode = { "n", "v" },
  --       "<cmd>Yazi<cr>",
  --       desc = "Open yazi at the current file",
  --     },
  --     {
  --       -- Open in the current working directory
  --       "<leader>cw",
  --       "<cmd>Yazi cwd<cr>",
  --       desc = "Open the file manager in nvim's working directory",
  --     },
  --     {
  --       "<c-up>",
  --       "<cmd>Yazi toggle<cr>",
  --       desc = "Resume the last yazi session",
  --     },
  --   },
  --   ---@type YaziConfig | {}
  --   opts = {
  --     -- if you want to open yazi instead of netrw, see below for more info
  --     open_for_directories = false,
  --     keymaps = {
  --       show_help = "<f1>",
  --     },
  --   },
  --   -- 👇 if you use `open_for_directories=true`, this is recommended
  --   init = function()
  --     -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
  --     -- vim.g.loaded_netrw = 1
  --     vim.g.loaded_netrwPlugin = 1
  --   end,
  -- }
}
