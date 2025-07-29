require("config.lazy")

vim.api.nvim_create_user_command("Here", ":!start %:p:h", {})

vim.api.nvim_create_user_command("GX", function()
  local url = vim.api.nvim_buf_get_name(0)
  print(url)
  if url then
    vim.ui.open(url)
  end
end, {})

require("config.options").setup()
require("config.clipboard").setup()
require("config.keymap").setup()
require("config.lsp").setup()
require("config.markdown").setup()
require("config.color").setup()
require("config.grep").setup()

vim.cmd [[
autocmd QuickfixCmdPost make,vimgrep copen
]]

vim.keymap.set("n", "<C-n>", ":cn<CR>", { noremap = true })
vim.keymap.set("n", "<C-p>", ":cp<CR>", { noremap = true })
