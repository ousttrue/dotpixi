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

-- local themes = {}
-- for k, v in pairs(wezterm.color.get_builtin_schemes()) do
--   table.insert(themes, k)
-- end
-- table.sort(themes, function(c1, c2)
--   return c1 < c2
-- end)

-- for k, v in pairs(wezterm.color.get_builtin_schemes()) do
--   local keys = ''
--   for kk, vv in pairs(v) do
--     keys = keys .. ',' .. kk
--   end
--   wezterm.log_info('keys', keys)
--   break
-- end

local home = os.getenv('HOME') or os.getenv("USERPROFILE")
local themes_file_name = string.format("%s/.config/wezterm/themes.json", home)

local f = io.open(themes_file_name, 'r')
if f then
  -- already exists. skip
  f:close()
else
  f = io.open(themes_file_name, 'w')
  if f then
    local schemes = {}
    for k, v in pairs(wezterm.color.get_builtin_schemes()) do
      table.insert(schemes, {
        name = k,
        foreground = v.foreground,
        background = v.background,
      })
    end
    table.sort(schemes, function(l, r)
      return l.name < r.name
    end)
    f:write(wezterm.json_encode(schemes))
    f:close()
    wezterm.log_info("write", themes_file_name)
  else
    wezterm.log_warn("fail to open", themes_file_name)
  end
end

-- local ps_script = string.format(
--   "%s | fzf | [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes",
--   wezterm.shell_quote_arg(themes))
--   '$([char]27)]1337;SetUserVar=color_scheme=$(($(echo ' ..
--   themes .. ' | fzf)))$([char]7)'
-- wezterm.log_info(ps_script)

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
      win:perform_action(wezterm.action.SplitPane({
        direction = "Right",
        size = { Percent = 25 },
        command = {
          args = { "pwsh", "-c", "fztheme", tostring(pane:pane_id()) },
        },
      }), pane)
    end),
  }
}

-- wezterm.on('window-focus-changed', function(window, pane)
--   local name = pane:get_domain_name()
--   local overrides = window:get_config_overrides() or {}
--   if name == 'local' then
--     overrides.color_scheme = 'Adventure'
--   else
--     overrides.color_scheme = 'Sagelight (base16)'
--   end
--   window:set_config_overrides(overrides)
-- end)

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
