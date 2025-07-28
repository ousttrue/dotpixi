local M = {}

---@return string
local function random_color_scheme()
  math.randomseed(os.time())
  local schemes = {
    "Atom",
    "Builtin Pastel Dark",
    "Chalkboard",
    "Dracula+",
    "Japanesque",
    "nord",
    "rebecca",
    "Wombat",
  }
  local i = math.random(#schemes)
  return schemes[i]
end

function M.setup(wezterm, config)
  wezterm.on('random-color-scheme', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    local scheme = random_color_scheme()
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
    -- window:toast_notification("theme", scheme)
    window:copy_to_clipboard("wezterm: color_scheme => " .. scheme)
  end)

  table.insert(config.keys,
    { key = 'F12', mods = 'CTRL', action = wezterm.action.EmitEvent 'random-color-scheme' }
  )
end

return M
