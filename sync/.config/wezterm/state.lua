---@type Wezterm
local wezterm = require 'wezterm' ---@diagnostic disable-line

local M = {
  color_scheme = 'Sandcastle (base16)',
  host = '🪟',
}

---@param window Window
---@param color_scheme string
function M:set_color_scheme(window, color_scheme)
  wezterm.log_info('set_color_scheme', color_scheme)
  self.color_scheme = color_scheme
  window:set_config_overrides {
    color_scheme = color_scheme
  }
  window:copy_to_clipboard(color_scheme)
end

return M
