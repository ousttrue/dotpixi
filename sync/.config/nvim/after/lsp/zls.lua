---@type vim.lsp.Config
local config = {
  cmd = { vim.fn.exepath("zls") },
}

return config
