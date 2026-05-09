-- project and cwd and buffer.cwd
--
-- project
--   .git
--   .pixi
--   build
--     pkg_a
--       compille_commands.json
--     pkg_b
--       compille_commands.json
--   src
--     pkg_a <- clangd root
--       package.xml
--       CMakeLists.txt
--       src
--         main.cpp
--     pkg_b <- clangd root
--       package.xml
--       CMakeLists.txt
--       src
--         main.cpp
--
-- のような構成に対応する。
--

---@alias ProjectType "none" | "git" | "cmake" | "meson" | "zig" | "pixi"
--
-- # c / c++
-- CMakeLists.txt
-- meson
-- build.zig
-- Makefile
--
-- # md
-- docusaurus.config.js
--
-- # ts / js / jsx / tsx / mdx / vite
--
-- # lua
-- vim
-- not nvim
-- lovr

local M = {
  root = vim.fn.getcwd(),
}

function M.setup()
end

function M.checkhealth()
  vim.health.start("path")
  vim.health.info("root: " .. M.root)
  vim.health.info("cwd: " .. vim.fn.getcwd())
  --
  -- each buffer lsp settings
  --
  -- make sure setup function parameters are ok
  -- if check_setup() then
  --   vim.health.ok("Setup is correct")
  -- else
  -- vim.health.error("Setup is incorrect")
  -- end
  -- do some more checking
  -- ...
end

function M.get_project()
end

return M
