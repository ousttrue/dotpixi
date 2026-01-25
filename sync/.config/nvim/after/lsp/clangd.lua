-- ---@alias ToolType "cmake" | "meson"
--
-- ---@return uv.fs_readdir.entry[]|nil
-- local function get_entries(dir)
--   local stat = vim.uv.fs_stat(dir)
--   if stat and stat.type == "directory" then
--     ---@diagnostic disable-next-line
--     local dir_t = vim.uv.fs_opendir(dir, nil, 1024)
--     assert(dir_t)
--     local items = vim.uv.fs_readdir(dir_t)
--     vim.uv.fs_closedir(dir_t)
--     return items;
--   end
-- end
--
-- -- */CMakeCache.txt: cmake
-- -- */meson-info/: meson
-- -- build.zig: zig build
-- ---@return ToolType?
-- local function get_build_tool(items)
--   for _, item in ipairs(items) do
--     if item.type == "file" and item.name == "CMakeCache.txt" then
--       return "cmake"
--     end
--     if item.type == "directory" and item.name == "meson-info" then
--       return "meson"
--     end
--   end
-- end
--
-- --- return dir, tool
-- ---@return string?
-- ---@return ToolType?
-- local function get_build_tool_recursive(dir, level)
--   -- build/windows/debug
--   if level > 3 then
--     return
--   end
--
--   local items = get_entries(dir)
--   if items then
--     -- first search file
--     local tool = get_build_tool(items)
--     if tool then
--       return dir, tool
--     end
--
--     -- if not found search dir
--     for _, item in ipairs(items) do
--       if item.type == "directory" then
--         -- recursive
--         local nest = vim.fs.joinpath(dir, item.name)
--         local _, tool = get_build_tool_recursive(nest, level + 1)
--         if nest then
--           return nest, tool
--         end
--       end
--     end
--   end
-- end
--
-- -- c か c++ の buildir(cmake or meson)を探す
-- ---@return string?
-- ---@return ToolType?
-- ---@return string?
-- local function get_c_builddir()
--   local list = {
--     -- !: if nil exit loop
--     os.getenv "BUILDDIR" or false,
--     --
--     ".build",
--     "build",
--     "builddir",
--     "build_android",
--   }
--   local cwd = vim.fn.getcwd()
--   for _, root in ipairs(list) do
--     if root then
--       local dir, tool = get_build_tool_recursive(vim.fs.joinpath(cwd, root), 0)
--       if tool then
--         return dir, tool
--       end
--     end
--   end
--
--   return cwd
--   -- return "builddir", "cmake"
-- end
--
-- local dir, tool = get_c_builddir()

local function get_compile_commands_json_dir()
  local dir = vim.fn.expand('%:p:h')

  local pixi_root = vim.fs.root(dir, { "pixi.toml" })
  if pixi_root then
    local name = vim.fn.expand('%:p:t')
    return vim.fs.joinpath(pixi_root, 'build', name)
  end

  local zig_root = vim.fs.root(dir, { "build.zig" })
  if zig_root then
    return zig_root
  end

  local cmake_root = vim.fs.root(dir, { "CMakeLists.txt" })
  if cmake_root then
    return cmake_root .. "/build"
  end

  return dir
end

---@type vim.lsp.Config
local config = {
  ---@param dispatchers vim.lsp.rpc.Dispatchers
  ---@param config vim.lsp.ClientConfig
  cmd = function(dispatchers, config)
    local dir = get_compile_commands_json_dir()
    print('get_compile_commands_json_dir => ' .. dir)
    --- lazy cmd
    local config_cmd = {
      vim.fn.exepath "clangd",
      "--header-insertion=never",
      "--clang-tidy",
      "--background-index",
      "--offset-encoding=utf-8",
      -- avoid stderr log message
      "--log=error",
      -- "--compile-commands-dir=" .. dir,
      "--compile-commands-dir=./build",
    }
    return vim.lsp.rpc.start(config_cmd, dispatchers, {
      cwd = config.cmd_cwd,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  root_markers = {
    -- ros2 package
    "package.xml",
    ".clangd",
    "compile_commands.json",
    "builddir/compile_commands.json",
    "build_android/compile_commands.json",
    "build.zig",
    "build/compile_commands.json",
  },
  filetypes = { "c", "cpp" },
  capabilities = {
    offsetEncoding = { 'utf-16' },
  },
}

return config
