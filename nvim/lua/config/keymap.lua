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

-- help: key-notation
function M.setup()
  vim.keymap.set({ "n", "i" }, "<C-s>", write_buffer, { noremap = true })
  vim.keymap.set("n", "<C-d>", ":qa<CR>", { noremap = true })
  vim.keymap.set("n", "<F7>", ":make<CR>", { noremap = true })
  vim.keymap.set("n", "M", ":Man<CR>", { noremap = true })

  vim.keymap.set("n", "<M-h>", "<C-w>h", { noremap = true })
  vim.keymap.set("n", "<M-j>", "<C-w>j", { noremap = true })
  vim.keymap.set("n", "<M-k>", "<C-w>k", { noremap = true })
  vim.keymap.set("n", "<M-l>", "<C-w>l", { noremap = true })

  -- vim.keymap.set("n", "q", "<cmd>:b#|bd#<CR>", { noremap = true })
  -- vim.keymap.set('n', 'q', '<cmd>b#<cr><cmd>bd#<cr>', { noremap = true })
  -- vim.keymap.set('n', 'q', '<cmd>bd<cr>', { noremap = true })
  vim.keymap.set('n', 'q', '<cmd>BufferClose<cr>', { noremap = true })
  vim.keymap.set('n', "<C-q>", '<cmd>tabclose<cr>', { noremap = true, silent = true })
  vim.keymap.set('n', 'L', '<cmd>BufferNext<cr>', { noremap = true, silent = true })
  vim.keymap.set('n', 'H', '<cmd>BufferPrevious<cr>', { noremap = true, silent = true })
  -- nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
  -- nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

  vim.keymap.set('n', "<C-l>", ':nohlsearch<CR><C-l>', { noremap = true, silent = true })

  vim.keymap.set('i', "<cr>",
    function()
      return vim.fn.pumvisible() == 0 and '<cr>' or '<c-y>'
    end,
    { noremap = true, expr = true }
  )

  vim.keymap.set('n', '<LEFT>', '<cmd>colder<cr>', { noremap = true, silent = true })
  vim.keymap.set('n', '<RIGHT>', '<cmd>cnewer<cr>', { noremap = true, silent = true })
end

return M
