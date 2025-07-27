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

  vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true })
  vim.keymap.set("n", "<M-j>", "<C-w>j", { noremap = true })
  vim.keymap.set("n", "<M-k>", "<C-w>k", { noremap = true })
  vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true })
end

return M
