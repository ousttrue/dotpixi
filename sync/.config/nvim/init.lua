require("config.lazy")

vim.api.nvim_create_user_command("Here", ":!start %:p:h", {})

require("config.options").setup()
require("config.clipboard").setup()
require("config.keymap").setup()
require("config.lsp").setup()

vim.cmd [[
autocmd QuickfixCmdPost make,vimgrep copen
]]

vim.keymap.set("n", "<C-n>", ":cn<CR>", { noremap = true })
vim.keymap.set("n", "<C-p>", ":cp<CR>", { noremap = true })
