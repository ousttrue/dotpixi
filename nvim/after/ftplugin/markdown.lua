local markdown = require("config.markdown");
vim.keymap.set("n", "<C-y>a", markdown.get_html_title, {
  buffer = true,
})
