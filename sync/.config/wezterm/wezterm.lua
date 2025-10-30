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

config.keys = {
  { mods = "ALT",       key = "c",          action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { mods = "ALT",       key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT",       key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },
  { mods = "ALT",       key = ",",          action = wezterm.action { ActivateTabRelative = -1 } },
  { mods = "ALT",       key = ".",          action = wezterm.action { ActivateTabRelative = 1 } },
  { mods = "ALT",       key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT",       key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },

  { mods = 'CMD|SHIFT', key = 'r',          action = wezterm.action.ReloadConfiguration },

  -- CTRL-SHIFT-l activates the debug overlay
  { mods = 'CTRL',      key = 'L',          action = wezterm.action.ShowDebugOverlay },
}

require("util.theme").setup(wezterm, config)

wezterm.on('window-focus-changed', function(window, pane)
  local name = pane:get_domain_name()
  local overrides = window:get_config_overrides() or {}
  if name == 'local' then
    overrides.color_scheme = 'Adventure'
  else
    overrides.color_scheme = 'Sagelight (base16)'
  end
  window:set_config_overrides(overrides)
end)

return config
