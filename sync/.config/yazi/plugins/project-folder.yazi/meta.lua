---@meta

---@class yazi.Rect
---@field x number
---@field y number
---@field w number
---@field h number

---@class yazi.Url

---@class yazi.File
---@field url yazi.Url

---@class yazi.Files
---@operator len(): number
---@field __index function(idx: number)yazi.File?

---@class yazi.Folder
---@field cwd yazi.Url
---@field files yazi.Files
---@field stage function()
---@field window yazi.Files

---@class yazi.Text

---@class yazi.Line
---@field truncate function()yazi.Text

---@class yazi.Widget

---@class yazi.PreviewerJob 
---@field area yazi.Rect,
---@field args table
---@field mime string
---@field file yazi.File
---@field skip number

---@class yazi.ya
ya = {}

-- https://yazi-rs.github.io/docs/plugins/utils#ya.emit
---@param cmd string
---@param args table
function ya.emit(cmd, args) end

-- https://yazi-rs.github.io/docs/plugins/utils#ya.preview_widget
---@param opts yazi.PreviewerJob
---@param widget yazi.Widget|yazi.Widget[]
function ya.preview_widget(opts, widget) end

cx = {
  ---@type yazi.Tab
  active = nil,
}

ui = {}

fs = {}

th = {}
