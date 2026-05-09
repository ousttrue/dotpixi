---@type vim.lsp.Config
local config = {
  cmd = { vim.fn.exepath "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { "wezterm.lua", ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    -- https://zenn.dev/uga_rosa/articles/afe384341fc2e1
    Lua = {
      runtime = {
        version = "LuaJIT",
        pathStrict = true,
        path = { "?.lua", "?/init.lua" },
      },
      workspace = {
        library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
          "${3rd}/luv/library",
          "${3rd}/busted/library",
          "${3rd}/luassert/library",
          vim.fn.stdpath("data") .. "/lazy/wezterm-types/lua/wezterm/types",
        }),
        checkThirdParty = "Disable",
      },
    },
  },
}

return config
