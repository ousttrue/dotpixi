-- https://wezterm.org/config/lua/general.html
-- https://www.lua.org/manual/5.4/
---@type Wezterm
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local DEFAULT_COLOR_SCHEME = {
  -- windows = 'Black Metal (Mayhem) (base16)',
  windows = 'Black Metal (Gorgoroth) (base16)',
  -- windows = 'Nebula (Mayhem) (base16)',

  -- linux = 'Gruvbox light, medium (base16)',
  -- linux = 'Brush Trees (base16)',
  -- linux = 'Atelier Savanna Light (base16)',
  -- linux = 'Solarized Light (Gogh)',
  -- linux = 'Solarized Dark (Gogh)',
  linux = 'Rosé Pine Moon (Gogh)',
  -- arch 青系
  -- arch = 'Catppuccin Frappé (Gogh)',
  arch = 'nordfox',
  -- darkmoss (base16)
  -- UnderTheSea

  -- ubuntu 赤系
  -- Ic Orange Ppl (Gogh)
  -- 3024Night (Gogh)
  -- Wild Cherry (Gogh)

  -- gentoo 紫系
  -- FairyFloss (Gogh)
  -- catppuccin-macchiato
  -- linux = 'Vaughn (Gogh)',
  -- linux = 'Gruvbox light, medium (base16)',

  -- wsl = 'Omni (Gogh)'
  wsl = 'Tomorrow Night'
  -- wsl = 'Hipster Green'
  -- Zenburn (base16)
}

---@class State
---@field color_scheme string?
---@field host nil | 'windows' | 'wsl' | 'linux'

if not wezterm.GLOBAL.state then
  ---@diagnostic disable-next-line
  wezterm.GLOBAL.state = {
  }
end

---@param _win_id integer
---@param key string
---@return string?
local function get_state(_win_id, key)
  local win_id = tostring(_win_id)
  local state = wezterm.GLOBAL.state
  local win_state = state[win_id]
  if win_state then
    -- wezterm.log_info(win_id, key, "<-", win_state[key])
    return win_state[key]
  else
    wezterm.log_info(win_id, 'no_win_state', key)
  end
end

---@param win_id integer
---@param key string
---@param value string
local function set_state(_win_id, key, value)
  local win_id = tostring(_win_id)
  wezterm.log_info(win_id, key, "=>", value)
  local state = wezterm.GLOBAL.state
  ---@type State
  local win_state = state[win_id]
  if not win_state then
    state[win_id] = {}
    win_state = state[win_id]
  end
  win_state[key] = value
  ---@diagnostic disable-next-line
  wezterm.GLOBAL.state = state
end

---@param host string
---@return string
local function get_host_icon(host)
  if host == 'windows' then
    return '🪟'
  elseif host == 'wsl' then
    return '⛺'
  elseif host == 'linux' then
    return '🐦'
  end

  return '❓'
end

local scheme_map = {}

---@param window Window
---@param color_scheme string
---@param use_clipboard boolean?
local function set_color_scheme(window, color_scheme, use_clipboard)
  wezterm.log_info(tostring(window:window_id()), 'set_color_scheme', color_scheme)
  local current_color_scheme = get_state(window:window_id(), 'color_scheme')
  if color_scheme ~= current_color_scheme then
    set_state(window:window_id(), 'color_scheme', color_scheme)
    -- window:set_config_overrides {
    --   color_scheme = color_scheme
    -- }
    window:set_config_overrides {
      colors = scheme_map[color_scheme]
    }
  end
  if use_clipboard then
    window:copy_to_clipboard(color_scheme)
  end
end

-- config.color_scheme = get_state().color_scheme
-- config.canonicalize_pasted_newlines = 'LineFeed'

config.automatically_reload_config = false

config.initial_cols = 120

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { "pwsh", "-nologo" }
  config.initial_rows = 60
else
  config.use_ime = true
  config.initial_rows = 40
end
config.font_size = 12

config.enable_kitty_graphics = true

local function make_palette(ansi)
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

---@alias Palette {
---  foreground: string,
---  background: string,
---  ansi: string[],
---  brights: string[],
---}

---@param k string
---@param v Palette
---@return nil | string
---@return nil | Palette
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
  -- if not is_gogh then
  --   return
  -- end
  -- if not is_base16 then
  --   return
  -- end

  return k, v
end

---@class Closed
---@field palette 'ansi'|'brights'
---@field index integer 1-8
---@field rgb string #RRGGBB
---@field r integer red 0-255
---@field g integer green 0-255
---@field b integer blue 0-255

---@return Closed?
local function get_closed(_target, ansi, brights)
  local sq = 255 * 255 + 255 * 255 + 255 * 255
  ---@type Closed
  local target = {
    palette = 'ansi',
    index = 0,
    rgb = _target,
    r = tonumber(_target:sub(2, 3), 16),
    g = tonumber(_target:sub(4, 5), 16),
    b = tonumber(_target:sub(6, 7), 16),
  }
  ---@type Closed?
  local current = nil

  for i, color in ipairs(ansi) do
    local r = tonumber(color:sub(2, 3), 16)
    local g = tonumber(color:sub(4, 5), 16)
    local b = tonumber(color:sub(6, 7), 16)
    local dr = target.r - r
    local dg = target.g - g
    local db = target.b - b
    if (dr * dr + dg * dg + db * db) < sq then
      current = {
        palette = 'ansi',
        index = i,
        rgb = color,
        r = r,
        g = g,
        b = b,
      }
      sq = new_sq
    end
  end
  for i, color in ipairs(brights) do
    local r = tonumber(color:sub(2, 3), 16)
    local g = tonumber(color:sub(4, 5), 16)
    local b = tonumber(color:sub(6, 7), 16)
    local dr = target.r - r
    local dg = target.g - g
    local db = target.b - b
    local new_sq = (dr * dr + dg * dg + db * db)
    if new_sq < sq then
      current = {
        palette = 'brights',
        index = i,
        rgb = color,
        r = r,
        g = g,
        b = b,
      }
      sq = new_sq
    end
  end

  return current
end

---@return table
---@return string
local function fix_palette(v)
  local fg = get_closed(v.foreground, v.ansi, v.brights)
  local suffix = '['
  if fg and (fg.palette ~= 'ansi' or fg.index ~= 8) then
    suffix = suffix .. fg.palette:sub(1, 1) .. tostring(fg.index)
    v.foreground = fg.rgb
    local tmp = v.ansi[8]
    v.ansi[8] = v[fg.palette][fg.index]
    v[fg.palette][fg.index] = tmp
  else
    suffix = suffix .. '__'
  end
  local bg = get_closed(v.background, v.ansi, v.brights)
  if bg and (bg.palette ~= 'ansi' or bg.index ~= 1) then
    suffix = suffix .. bg.palette:sub(1, 1) .. tostring(bg.index)
    v.background = bg.rgb
    local tmp = v.ansi[1]
    v.ansi[1] = v[bg.palette][bg.index]
    v[bg.palette][bg.index] = tmp
  else
    suffix = suffix .. '__'
  end
  suffix = suffix .. ']'
  return v, suffix
end

local choices = {}
for k, v in pairs(wezterm.color.get_builtin_schemes()) do
  k, v = filter_color_scheme(k, v) ---@diagnostic disable-line
  if k and v then
    v, suffix = fix_palette(v)
    table.insert(choices, {
      id = k,
      label = wezterm.format({
        { Text = make_palette(v.ansi) },
        { Text = make_palette(v.brights) },
        { Text = '\x1b[0m ' },
        { Foreground = { Color = v.foreground } },
        { Background = { Color = v.background } },
        { Text = k .. suffix }, }),
    })
    scheme_map[k] = v
  end
end

config.keys = {
  {
    mods = 'SHIFT',
    key = 'Insert',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    mods = 'ALT',
    key = 'c',
    action = wezterm.action_callback(function(win, pane)
      -- if get_state().host == 'wsl' then
      --   win:perform_action(wezterm.action.SpawnCommandInNewTab { cwd = '~' }, pane)
      -- else
      win:perform_action(wezterm.action.SpawnTab { DomainName = pane:get_domain_name() }, pane)
      -- end
    end)
  },
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
            set_color_scheme(inner_window, id, true)
          end
        end),
        fuzzy   = true,
      }), pane)
    end),
  }
}

wezterm.on('gui-attached', function(domain)
  ---@diagnostic disable-next-line
  local domain_name = domain:name()
  wezterm.log_info('domain_name:', domain_name)
  -- if domain_name:find("^WSL:") then
  --   get_state().host = 'wsl'
  -- end

  -- local gui = wezterm.gui
  -- if gui then
  --   local screens = gui.screens()
  --   -- wezterm.log_info("screens", screens)
  -- end
  -- -- config.initial_rows = screens.height / 12 - 2
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

  -- wezterm.log_info(window:window_id(), 'domain_name=>', domain_name, 'host=>', host)
  if host then
    set_state(window:window_id(), 'host', host)
    local color_scheme = get_state(window:window_id(), 'color_scheme')
    if not color_scheme then
      set_color_scheme(window, DEFAULT_COLOR_SCHEME[host])
    end
  end
end)

wezterm.on('user-var-changed', function(window, pane, name, value)
  local x = ''
  for i = 1, #value do
    x = x .. ',' .. string.format("%d", string.byte(value:sub(i, i)))
  end
  wezterm.log_info(window:window_id(), name, '=>', value, x)

  if name == 'host' then
    set_state(window:window_id(), 'host', value)
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

  local host = get_state(tab.window_id, 'host') or ''
  return zoomed ..
      get_host_icon(host) .. title .. '  [' .. (get_state(tab.window_id, 'color_scheme') or 'default') .. ']'
end)

-- OSC133
-- https://zenn.dev/ymotongpoo/scraps/ec945f11b2b750
local copy_mode = nil
if wezterm.gui then
  wezterm.log_info('## setup osc133 ##')
  copy_mode = wezterm.gui.default_key_tables().copy_mode
  table.insert(
    copy_mode,
    -- move the cursor backwards to the start of the current zone, or to the prior zone if already at the start
    { key = 'z', mods = 'NONE', action = wezterm.action.CopyMode { MoveBackwardZoneOfType = 'Prompt' } }
  )

  table.insert(
    copy_mode,
    -- move the cursor forwards to the start of the next zone
    { key = 'Z', mods = 'NONE', action = wezterm.action.CopyMode { MoveForwardZoneOfType = 'Prompt' } }
  )

  -- local found = false
  -- local yank_action = wezterm.action.Multiple({
  --   { CopyTo = 'Clipboard' },
  --   wezterm.action.Multiple({
  --     'ScrollToBottom',
  --     { CopyMode = 'Close' },
  --   }),

  -- local yank_action = wezterm.action.Multiple { { CopyTo = 'Clipboard' }, { Multiple = { 'ScrollToBottom', { CopyMode = 'Close' } } } }

  -- for i, k in ipairs(copy_mode) do
  --   if k.key == 'y' then
  --     found = true
  --     k.action = yank_action
  --   end
  -- end
  -- if not found then
  table.insert(
    copy_mode,
    {
      key = 'y',
      mods = 'NONE',
      -- action = yank_action,
      action = { CopyTo = 'Clipboard' },
      -- action = wezterm.action_callback(function(w, p)
      --   wezterm.log_info("y")
      --   window:perform_action(wezterm.action.CopyTo 'Clipboard', p)
      -- end
    }
  )
  -- end

  -- window:set_config_overrides {
  config.key_tables = {
    copy_mode = copy_mode,
  }
  -- }
end

wezterm.log_info('## reloaded ##')

return config
