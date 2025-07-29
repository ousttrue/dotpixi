---@type vim.lsp.Config
local config = {
  cmd = { vim.fn.exepath("bash-language-server"), "start" }
}

return config
