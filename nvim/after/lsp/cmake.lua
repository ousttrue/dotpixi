---@type vim.lsp.Config
local config = {
  cmd = {
    vim.fn.exepath("cmake-language-server")
  }
}

return config
