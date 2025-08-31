---@alias ToolType 'cmake' | 'meson' | 'zig'

-- */CMakeCache.txt: cmake
-- */meson-info/: meson
-- build.zig: zig build
---@return string?
---@return ToolType?
local function get_build_tool(dir, level)
  -- build/windows/debug
  if level > 3 then
    return
  end
  local stat = vim.uv.fs_stat(dir)
  if stat and stat.type == "directory" then
    local dir_t = vim.uv.fs_opendir(dir, nil, 99)
    assert(dir_t)
    local items = vim.uv.fs_readdir(dir_t)
    if not items then
      return
    end
    -- assert(items)
    -- print(dir, level, #items)
    -- print("fs_stat", vim.inspect(items))
    vim.uv.fs_closedir(dir_t)

    -- first search file
    for _, item in ipairs(items) do
      if item.type == "file" and item.name == "CMakeCache.txt" then
        return dir, "cmake"
      end
      if item.type == "file" and item.name == "meson-info" then
        return dir, "meson"
      end
    end

    -- if not found search dir
    for _, item in ipairs(items) do
      if item.type == "directory" then
        -- recursive
        local nest = vim.fs.joinpath(dir, item.name)
        local nest_dir, tool = get_build_tool(nest, level + 1)
        if nest_dir then
          return nest_dir, tool
        end
      end
    end
  end
end

-- c か c++ の buildir(cmake or meson)を探す
---@return string?
---@return ToolType?
---@return string?
local function get_c_builddir()
  local list = {
    -- !: if nil exit loop
    os.getenv "BUILDDIR" or false,
    --
    ".build",
    "build",
    "builddir",
    "build_android",
  }
  local cwd = vim.fn.getcwd()
  for _, root in ipairs(list) do
    if root then
      local dir, tool = get_build_tool(vim.fs.joinpath(cwd, root), 0)
      if tool then
        return dir, tool
      end
    end
  end
  -- return "builddir", "cmake"
end

local dir, tool = get_c_builddir()

---@type vim.lsp.Config
local config = {
  cmd = {
    vim.fn.exepath "clangd",
    "--header-insertion=never",
    "--clang-tidy",
    "--background-index",
    "--offset-encoding=utf-8",
    -- avoid stderr log message
    "--log=error",
    "--compile-commands-dir=" .. (dir or "."),
  },
  root_markers = {
    ".clangd",
    "compile_commands.json",
    "builddir/compile_commands.json",
    "build_android/compile_commands.json",
  },
  filetypes = { "c", "cpp" },
}

return config
