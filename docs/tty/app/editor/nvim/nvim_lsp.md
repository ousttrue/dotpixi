https://neovim.io/doc/user/lsp/

# vim.lsp.enable と vim.lsp.start

root_dir(function) は lsp_enable_callback で解決される

- `FileType` event => `lsp_enable_callback`
  - `vim.lsp.start(config, opts)`
    - `vim.lsp.buf_attach_client(bufnr, client_id)`
      - `client:on_attach(bufnr)`

```lua
  api.nvim_exec_autocmds('LspAttach', {
    buf = bufnr,
    modeline = false,
    data = { client_id = self.id },
  })
```

- config.on_attach
