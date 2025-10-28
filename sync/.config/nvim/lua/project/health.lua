-- https://neovim.io/doc/user/health.html#_create-a-healthcheck
local M = {}

M.check = function()
  require("project").checkhealth()
end

return M
