---@type LazySpec[]
return {
  {
    'smithbm2316/centerpad.nvim',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require'centerpad'.toggle()<cr>",
        { silent = true, noremap = true })
    end
  },
  -- {
  --   "emmanueltouzery/key-menu.nvim",
  --   config = function()
  --     vim.o.timeoutlen = 300
  --     require 'key-menu'.set('n', '<Space>')
  --     require 'key-menu'.set('n', 'g')
  --   end,
  -- },
  -- {
  --   'https://gitlab.com/itaranto/id3.nvim',
  --   version = '*',
  --   config = function()
  --     require('id3').setup {
  --       mp3_tool = 'id3lib',
  --     }
  --   end,
  -- },
  -- yazi
  {
    "rolv-apneseth/tfm.nvim",
    lazy = false,
    opts = {
      -- TFM to use
      -- Possible choices: "ranger" | "nnn" | "lf" | "vifm" | "yazi" (default)
      file_manager = "yazi",
      -- Replace netrw entirely
      -- Default: false
      replace_netrw = true,
      -- Enable creation of commands
      -- Default: false
      -- Commands:
      --   Tfm: selected file(s) will be opened in the current window
      --   TfmSplit: selected file(s) will be opened in a horizontal split
      --   TfmVsplit: selected file(s) will be opened in a vertical split
      --   TfmTabedit: selected file(s) will be opened in a new tab page
      enable_cmds = true,
      -- Custom keybindings only applied within the TFM buffer
      -- Default: {}
      keybindings = {
        ["<C-[>"] = "<ESC>",
        ["<ESC>"] = "<ESC>",
        ["<C-h>"] = "<BS>",
        -- Override the open mode (i.e. vertical/horizontal split, new tab)
        -- Tip: you can add an extra `<CR>` to the end of these to immediately open the selected file(s) (assuming the TFM uses `enter` to finalise selection)
        ["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
        ["<C-x>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
        ["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
      },
      -- Customise UI. The below options are the default
      ui = {
        border = "rounded",
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
      },
    },
    -- config = function()
    --   -- Set keymap so you can open the default terminal file manager (yazi)
    --   vim.api.nvim_set_keymap("n", "<C-e>", "", {
    --     noremap = true,
    --     callback = require("tfm").open,
    --   })
    -- end,
    keys = {
      -- Make sure to change these keybindings to your preference,
      -- and remove the ones you won't use
      {
        "<C-e>",
        ":Tfm<CR>",
        desc = "TFM",
      },
      -- {
      --   "<leader>mh",
      --   ":TfmSplit<CR>",
      --   desc = "TFM - horizontal split",
      -- },
      -- {
      --   "<leader>mv",
      --   ":TfmVsplit<CR>",
      --   desc = "TFM - vertical split",
      -- },
      -- {
      --   "<leader>mt",
      --   ":TfmTabedit<CR>",
      --   desc = "TFM - new tab",
      -- },
    },
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
