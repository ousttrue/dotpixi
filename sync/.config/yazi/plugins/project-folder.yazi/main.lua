--- @sync peek

local M = {}

-- Previewer interface. from [j] or [k]
---@param job yazi.PreviewerJob
function M:peek(job)
  -- Use ya.err for ; prefix makes it easy to grep
  local folder = cx.active.preview.folder
  if not folder or folder.cwd ~= job.file.url then
    return
  end

  local bound = math.max(0, #folder.files - job.area.h)
  if job.skip > bound then
    return ya.emit("peek", { bound, only_if = job.file.url, upper_bound = true })
  end

  if #folder.files == 0 then
    local done, err = folder.stage()
    local s = not done and "Loading..." or not err and "No items" or string.format("Error: %s", err)
    return ya.preview_widget(job, ui.Line(s):area(job.area):align(ui.Align.CENTER))
  end

  ---@type yazi.Text[]
  local items = {}
  for i, f in ipairs(folder.window) do
    local entity = Entity:new(f)
    items[#items + 1] = entity:redraw():truncate {
      max = job.area.w,
      ellipsis = entity:ellipsis(job.area.w),
    }
  end

  ya.preview_widget(job, {
    ui.List(items):area(job.area),
    table.unpack(Marker:new(job.area, folder):redraw()),
  })
end

-- Previewer interface. from [J] or [K]
---@param job {}
function M:seek(job)
  local folder = cx.active.preview.folder
  if folder and folder.cwd == job.file.url then
    local step = math.floor(job.units * job.area.h / 10)
    local bound = math.max(0, #folder.files - job.area.h)
    ya.emit("peek", {
      ya.clamp(0, cx.active.preview.skip + step, bound),
      only_if = job.file.url,
    })
  end
end

return M
