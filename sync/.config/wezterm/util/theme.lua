local M = {}

local schemes_local = {
  "Atom",
  "Builtin Pastel Dark",
  "Chalkboard",
  "Dracula+",
}

local schemes_remote = {
  "Japanesque",
  "nord",
  "rebecca",
  "Wombat",
}

---@param list string[]
---@return string
local function get_random(list)
  math.randomseed(os.time())
  local i = math.random(#list)
  return list[i]
end

local function random_color_scheme(domain_name)
  if domain_name then
    return get_random(schemes_local)
  else
    return get_random(schemes_local)
  end
end

function M.setup(wezterm, config)
  -- wezterm.on('random-color-scheme', function(window, pane)
  --   local overrides = window:get_config_overrides() or {}
  --
  --   local scheme = random_color_scheme(config.active_pane.get_domain_name())
  --   overrides.color_scheme = scheme
  --   window:set_config_overrides(overrides)
  --   -- window:toast_notification("theme", scheme)
  --   window:copy_to_clipboard("wezterm: color_scheme => " .. scheme)
  -- end)
  --
  -- table.insert(config.keys,
  --   { key = 'F12', mods = 'CTRL', action = wezterm.action.EmitEvent 'random-color-scheme' }
  -- )

  -- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  --   tab.window:toast_notification("domain", "hello")
  -- end)
end

return M
