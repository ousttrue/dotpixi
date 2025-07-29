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

一から設定しなおし

https://neovim.io/doc/

- [x] lazy の分割設定
- [x] 0.11 スタイルの lsp 設定
- [x] mason 使う. `vim.fn.exepath`
- [x] vim.lsp.completion
- [x] none-ls(prettierdなど)

#### vim.lsp.config の初期化順

lspconfig をインストールするが setup しない。手動で enable する

- `<rtp>/lsp/*.lua`
- lazy による lspconfig install で `<rtp>/lsp/*.lua` が更新される
- `<rtp>/after/lsp/*.lua`

after に配置しないと上書きされて負ける

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
