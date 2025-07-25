# dotpixi

新 dotfiles 管理(2025)

- pixi で pyproject.toml
- ArchLinux と Windows11
- python でシンボリックリンクの管理ツールを実装する
- `sync` directory を `$HOME` に見立てて、この配下にファイルを配置して git 管理する
- file を symlink して、directory を symlink しない方針
- `$XDG_CONFIG_HOME` と $APPDATA で設定を共有する(同じ内容を配置できる場合)

| app     | linux               | windows                  | note                        |
| ------- | ------------------- | ------------------------ | --------------------------- |
| wezterm | `~/.config/wezterm` | `~/.config/wezterm`      |                             |
| nvim    | `~/.config/nvim`    | `%XDG_CONFIG_HOME%/nvim` | 環境変数 `XDG_CONFIG_HOME`  |
| yazi    | `~/.config/yazi`    | `%APPDATA%/yazi/config`  | 環境変数 `YAZI_CONFIG_HOME` |

## term / multiplexer

### WezTerm

https://wezterm.org/config/files.html

### tmux

https://github.com/tmux/tmux/wiki

### yaft

https://github.com/uobikiemukot/yaft

## shell

### bash

### powershell

## editor

### neovim

https://neovim.io/doc/

- 一から設定しなおし
- lazy の分割設定
- 0.11 スタイルの lsp 設定
- lspconfig 使うが setup しない。手動で enable する
- mason 使う
- vim.lsp.completion
- none-ls(prettierd)

## cui / tui

### yazi

https://yazi-rs.github.io/docs/configuration/overview

neotree から乗り換え

### lazygit

https://github.com/jesseduffield/lazygit

fugitive から乗り換え

### fzf

### fd

### rg

### zoxide
