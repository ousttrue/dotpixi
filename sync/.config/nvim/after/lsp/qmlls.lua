---@type vim.lsp.Config
local config = {
  cmd = { vim.fn.exepath("qmlls6") },
  filetypes = { "qml" },
}

return config
