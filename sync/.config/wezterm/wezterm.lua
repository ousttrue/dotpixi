-- https://wezterm.org/
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
-- config.color_scheme = 'AdventureTime'

config.keys = {
  { mods = "ALT", key = "c",          action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { mods = "ALT", key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT", key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },
  { mods = "ALT", key = ",",          action = wezterm.action { ActivateTabRelative = -1 } },
  { mods = "ALT", key = ".",          action = wezterm.action { ActivateTabRelative = 1 } },
  { mods = "ALT", key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT", key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },
}

return config
