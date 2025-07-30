---@type vim.lsp.Config
return {
  cmd = { vim.fn.exepath("ruff"), "server" },
  settings = {
  }
}
