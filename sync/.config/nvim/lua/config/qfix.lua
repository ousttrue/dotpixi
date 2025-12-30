local M = {
}

function M.setup()
  vim.cmd [[
autocmd QuickfixCmdPost make,vimgrep copen 7
]]
end

return M
