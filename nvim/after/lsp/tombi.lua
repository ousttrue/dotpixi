---@type vim.lsp.Config
return {
  cmd = { vim.fn.exepath("tombi"), "lsp" },
  filetypes = { "toml" },
}
