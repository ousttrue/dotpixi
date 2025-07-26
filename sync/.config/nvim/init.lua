require("config.lazy")

vim.api.nvim_create_user_command("Here", ":!start %:p:h", {})

require("config.options").setup()
require("config.clipboard").setup()
require("config.keymap").setup()
require("config.lsp").setup()
