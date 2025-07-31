--
-- clipboard
--
local M = {}

function M.setup()
  vim.opt.clipboard:append { "unnamedplus" }

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

  -- require xclip ? xsel ?
  -- vim.keymap.set({ "i", "c" }, "<S-Insert>", "<C-R>+", { noremap = true })
  -- vim.keymap.set({ "n" }, "<S-Insert>", "p", { noremap = true })
end

return M
