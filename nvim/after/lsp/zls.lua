---@type vim.lsp.Config
local config = {
  cmd = { vim.fn.exepath("zls") },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = false,
        }
      }
    }
  }
}

return config
