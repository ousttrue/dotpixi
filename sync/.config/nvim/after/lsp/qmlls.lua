local qmlls = vim.fn.exepath("qmlls6")
if #qmlls == 0 then
  qmlls = vim.fn.exepath("qmlls")
end
print(qmlls)

---@type vim.lsp.Config
local config = {
  cmd = { qmlls, "-I", ".pixi/envs/default/Library/lib/qt6/qml" },
  filetypes = { "qml" },
}

return config
