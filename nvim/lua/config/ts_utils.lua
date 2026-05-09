local M = {}

function M.get_node_at_cursor()
  local bufnr = vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1 -- 0-based
  local parser = vim.treesitter.get_parser(bufnr, 'markdown')
  if not parser then
    return nil
  end
  local tree = parser:parse()[1]
  local root = tree:root()
  return root:named_descendant_for_range(row, col, row, col)
end

return M
