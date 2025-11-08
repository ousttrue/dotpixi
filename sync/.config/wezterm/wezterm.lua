-- https://wezterm.org/
---@type Wezterm
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- We are running on Windows; maybe we emit different
  -- key assignments here?
  config.default_prog = { "pwsh", "-nologo" }
end

config.initial_cols = 120
config.initial_rows = 60
config.font_size = 12
config.enable_kitty_graphics = true

local choices = {}
for k, v in pairs(wezterm.color.get_builtin_schemes()) do
  table.insert(choices, {
    id = k,
    label = wezterm.format({
      { Foreground = { Color = v.foreground } },
      { Background = { Color = v.background } },
      { Text = k }, }),
  })
end

config.keys = {
  { mods = "ALT",  key = "c",          action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { mods = "ALT",  key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT",  key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },
  { mods = "ALT",  key = ",",          action = wezterm.action { ActivateTabRelative = -1 } },
  { mods = "ALT",  key = ".",          action = wezterm.action { ActivateTabRelative = 1 } },
  { mods = "ALT",  key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT",  key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },

  { mods = 'CTRL', key = 'R',          action = wezterm.action.ReloadConfiguration },

  -- CTRL-SHIFT-l activates the debug overlay
  { mods = 'CTRL', key = 'L',          action = wezterm.action.ShowDebugOverlay },

  {
    mods = "ALT",
    key = 'F12',
    action = wezterm.action_callback(function(win, pane)
      win:perform_action(wezterm.action.InputSelector({
        title   = 'color_scheme',
        choices = choices,
        action  = wezterm.action_callback(function(inner_window, _, id)
          inner_window:set_config_overrides {
            color_scheme = id,
          }
        end),
        fuzzy   = true,
      }), pane)
    end),
  }
}

wezterm.on('user-var-changed', function(window, pane, name, value)
  local x = ''
  for i = 1, #value do
    x = x .. ',' .. string.format("%d", string.byte(value:sub(i, i)))
  end
  wezterm.log_info(name, '=>', value, x)

  if name == 'color_scheme' then
    -- local overrides = window:get_config_overrides() or {}
    window:set_config_overrides {
      color_scheme = value
    }
  end
end)

wezterm.log_info('reloaded')

return config
