-- https://wezterm.org/config/lua/general.html
-- https://www.lua.org/manual/5.4/
---@type Wezterm
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local DEFAULT_COLOR_SCHEME = {
  windows = 'Black Metal (Mayhem) (base16)',
  -- windows = 'Nebula (Mayhem) (base16)',
  linux = 'Gruvbox light, medium (base16)',
}

---@class State
---@field color_scheme string?
---@field host nil | 'windows' | 'wsl' | 'linux'

if not wezterm.GLOBAL.state then
  ---@diagnostic disable-next-line
  wezterm.GLOBAL.state = {
  }
end

---@return State
function get_state()
  return wezterm.GLOBAL.state
end

---@return string
function get_host_icon()
  local host = get_state().host
  if host == 'windows' then
    return '🪟'
  elseif host == 'wsl' then
    return '⛺'
  elseif host == 'linux' then
    return '🐦'
  end

  return '❓'
end

---@param window Window
---@param color_scheme string
function set_color_scheme(window, color_scheme)
  wezterm.log_info('set_color_scheme', color_scheme)
  local state = get_state()
  if state.color_scheme == color_scheme then
    return
  end

  state.color_scheme = color_scheme
  wezterm.GLOBAL.state = state ---@diagnostic disable-line
  window:set_config_overrides {
    color_scheme = color_scheme
  }
  window:copy_to_clipboard(color_scheme)
end

config.color_scheme = get_state().color_scheme

config.automatically_reload_config = true

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- We are running on Windows; maybe we emit different
  -- key assignments here?
  config.default_prog = { "pwsh", "-nologo" }
end

-- local wsl_domains = wezterm.default_wsl_domains()
-- for idx, dom in ipairs(wsl_domains) do
--   wezterm.log_info("wsl_domain", dom.name, dom.default_prog)
--   default_cwd = "~"
-- end
-- config.wsl_domains = wsl_domains

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
  -- local is_gogh = k:find("%(Gogh%)$")
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
            set_color_scheme(inner_window, id)
          end
        end),
        fuzzy   = true,
      }), pane)
    end),
  }
}

wezterm.on('gui-attached', function(domain)
  ---@diagnostic disable-next-line
  -- local domain_name = domain:name()
  -- wezterm.log_info('domain_name:', domain_name)
  -- if domain_name:find("^WSL:") then
  --   get_state().host = 'wsl'
  -- end
end)

wezterm.on('window-focus-changed', function(window, pane)
  local domain_name = pane:get_domain_name()
  local host = nil
  if domain_name == 'local' then
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
      host = 'windows'
    else
      host = 'linux'
    end
  elseif domain_name:find("^WSL:") then
    host = 'wsl'
  end

  local m = domain_name:match("^SSH to (%g+)")
  if m then
    host = 'linux'
  end

  wezterm.log_info('domain_name:', domain_name, host)
  local state = get_state()
  state.host = host
  local color_scheme = DEFAULT_COLOR_SCHEME[host]
  if color_scheme then
    set_color_scheme(window, color_scheme)
  end
  wezterm.GLOBAL.state = state ---@diagnostic disable-line
end)

wezterm.on('user-var-changed', function(window, pane, name, value)
  local x = ''
  for i = 1, #value do
    x = x .. ',' .. string.format("%d", string.byte(value:sub(i, i)))
  end
  wezterm.log_info(name, '=>', value, x)

  if name == 'host' then
    get_state().host = value
  end
end)

wezterm.on('format-window-title', function(
    tab, ---@param tab TabInformation
    pane, ---@param pane PaneInformation
    tabs, ---@param tabs TabInformation[]
    panes, ---@param panes PaneInformation[]
    ---@diagnostic disable-next-line
    _config ---@param _config Config
)
  -- wezterm.log_info("window => %d", tab.tab_id)
  -- wezterm.log_info("pane => %d", pane.pane_id)

  -- local active_tab_index = 0
  -- for i, item in ipairs(tabs) do
  --   if item.tab_id == tab.tab_id then
  --     active_tab_index = i
  --   end
  -- end
  -- local index = ''
  -- if #tabs > 1 then
  --   index = string.format('[%d/%d] ', active_tab_index, #tabs)
  -- end

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

  return zoomed .. get_host_icon() .. title .. '  [' .. (get_state().color_scheme or 'default') .. ']'
end)

wezterm.log_info('reloaded')

return config
