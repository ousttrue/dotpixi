--
-- clipboard
--

--  https://zenn.dev/goropikari/articles/506e08e7ad52af
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

local M = {}

function M.setup()
  vim.opt.clipboard:append { "unnamedplus" }

  if vim.fn.has('win64') == 1 then
    vim.g.clipboard = {
      name = "OSC 52 / windows",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      -- paste from windows clipbaord
      -- https://www.reddit.com/r/neovim/comments/17udtc4/clipboard_is_slow_after_setting_gclipboard_wsl2/
      paste = {
        ['+'] = "powershell.exe -noprofile -c [Console]::Out.Write((Get-Clipboard).Replace('`r`n', '`n'))",
        ['*'] = "powershell.exe -noprofile -c [Console]::Out.Write((Get-Clipboard).Replace('`r`n', '`n'))",
      },
    }
  else
    vim.g.clipboard = {
      name = "OSC 52 / linux",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = paste,
        ["*"] = paste,
      },
    }
  end

  -- require xclip ? xsel ?
  -- vim.keymap.set({ "i", "c" }, "<S-Insert>", "<C-R>+", { noremap = true })
  -- vim.keymap.set({ "n" }, "<S-Insert>", "p", { noremap = true })
end

return M
