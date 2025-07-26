--
-- keyap
--
local M = {}

local function write_buffer()
  if vim.startswith(vim.fn.mode(), "i") then
    vim.cmd "stopinsert"
  end
  -- vim.lsp.buf.format { async = false }
  vim.api.nvim_command "write"
end

function M.setup()
  vim.keymap.set({ "n", "i" }, "<C-s>", write_buffer, { noremap = true })
  vim.keymap.set("n", "<C-d>", ":qa<CR>", { noremap = true })
  vim.keymap.set("n", "<F7>", ":make<CR>", { noremap = true })
end

return M
