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

local function make_pallete(ansi)
  local SGR = '\x1b['
  local str = ''
  for _, v in ipairs(ansi) do
    local r = tonumber(v:sub(2, 3), 16)
    local g = tonumber(v:sub(4, 5), 16)
    local b = tonumber(v:sub(6, 7), 16)
    local add = string.format("%s48;2;%d;%d;%dm ", SGR, r, g, b)
    str = str .. add
  end
  return str
end

---@alias Pallete {
---  foreground: string,
---  background: string,
---  ansi: string[],
---  brights: string[],
---}
---@param k string
---@param v Pallete
---@return nil | string
---@return nil | Pallete
local function filter_color_scheme(k, v)
  if not v.ansi then
    return
  end
  if v.background == v.ansi[9] then
    -- skip. invisible comment
    return
  end
  local is_gogh = k:find("%(Gogh%)$")
  local is_base16 = k:find("%(base16%)$")
  -- if is_gogh then
  --   return
  -- end
  if not is_base16 then
    return
  end

  return k, v
end
local choices = {}
for k, v in pairs(wezterm.color.get_builtin_schemes()) do
  k, v = filter_color_scheme(k, v) ---@diagnostic disable-line
  if k and v then
    table.insert(choices, {
      id = k,
      label = wezterm.format({
        { Text = make_pallete(v.ansi) },
        { Text = make_pallete(v.brights) },
        { Text = '\x1b[0m ' },
        { Foreground = { Color = v.foreground } },
        { Background = { Color = v.background } },
        { Text = k }, }),
    })
  end
end

config.keys = {
  { mods = "ALT",  key = "c",          action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { mods = "ALT",  key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT",  key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },
  { mods = "ALT",  key = ",",          action = wezterm.action { ActivateTabRelative = -1 } },
  { mods = "ALT",  key = ".",          action = wezterm.action { ActivateTabRelative = 1 } },
  { mods = "ALT",  key = "LeftArrow",  action = wezterm.action { MoveTabRelative = -1 } },
  { mods = "ALT",  key = "RightArrow", action = wezterm.action { MoveTabRelative = 1 } },
  { mods = "CTRL", key = 'Enter',      action = wezterm.action.TogglePaneZoomState },

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
          if id then
            inner_window:set_config_overrides {
              color_scheme = id,
            }
          end
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

wezterm.on('format-window-title', function(
    tab, ---@param tab TabInformation
    pane, ---@param pane PaneInformation
    tabs, ---@param tabs TabInformation[]
    panes, ---@param panes PaneInformation[]
    _config ---@param _config Config
)
  -- wezterm.log_info("window => %d", tab.tab_id)
  -- wezterm.log_info("pane => %d", pane.pane_id)

  local active_tab_index = 0
  for i, item in ipairs(tabs) do
    if item.tab_id == tab.tab_id then
      active_tab_index = i
    end
  end
  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', active_tab_index, #tabs)
  end

  local title = ''
  local zoomed = ''
  for _, pane_info in ipairs(panes) do
    if pane_info.pane_id == pane.pane_id then
      title = pane_info.title
      if pane_info.is_zoomed then
        zoomed = '[Z] '
      end
    end
  end

  return zoomed .. index .. title
end)

wezterm.log_info('reloaded')

return config
