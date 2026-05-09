---@type LazySpec[]
local config = {
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
  {
    "chenasraf/text-transform.nvim",
    -- stable version
    version = "*", -- or: tag = "stable"
    -- dev version
    -- branch = "develop",
    -- Optional - for Telescope popup
    -- dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
    config = function()
      require("text-transform").setup({
        --- Prints information about internals of the plugin. Very verbose, only useful for debugging.
        debug = false,
        --- Keymap configurations
        keymap = {
          --- Keymap to open the telescope popup. Set to `false` or `nil` to disable keymapping
          --- You can always customize your own keymapping manually.
          telescope_popup = {
            --- Opens the popup in normal mode
            ["n"] = "<Leader>~",
            --- Opens the popup in visual/visual block modes
            ["v"] = "<Leader>~",
          },
        },
        ---
        --- Configurations for the text-transform replacers
        --- Keys indicate the replacer name, and the value is a table with the following options:
        ---
        --- - `enabled` (boolean): Enable or disable the replacer - disabled replacers do not show up in the popup.
        replacers = {
          camel_case = { enabled = true },
          const_case = { enabled = true },
          dot_case = { enabled = true },
          kebab_case = { enabled = true },
          pascal_case = { enabled = true },
          snake_case = { enabled = true },
          title_case = { enabled = true },
        },

        --- Sort the replacers in the popup.
        --- Possible values: 'frequency', 'name'
        sort_by = "frequency",

        --- The popup type to show.
        --- Possible values: 'telescope', 'select'
        popup_type = 'select'
      })
    end,
  }
}

return config
