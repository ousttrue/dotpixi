--
-- options
--

local M = {}

function M.setup()
  vim.opt.belloff = "all"
  vim.opt.hidden = true
  vim.opt.swapfile = false

  -- visual
  vim.opt.winborder = "rounded"
  vim.opt.visualbell = false
  vim.opt.splitkeep = "screen"
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
  vim.opt.list = true
  vim.opt.listchars = {
    eol = "$",
    tab = ">-",
    trail = "~",
    extends = ">",
    precedes = "<",
    conceal = "_",
  }
  -- vim.cmd[[set iskeyword-=_]]
  vim.opt.splitkeep = "screen"

  vim.opt.signcolumn = "yes" -- Always show sign column
  vim.opt.showtabline = 2
  -- vim.opt.laststatus = 3
  vim.opt.laststatus = 2
  -- vim.opt.cmdheight = 0
  vim.opt.number = false

  -- for tmux
  -- vim.opt.termguicolors = true -- Enable colors in terminal
  -- use ANSI 16 colors
  vim.opt.termguicolors = false

  -- buffer
  vim.opt.fileformats = { "unix", "dos" }
end

return M
