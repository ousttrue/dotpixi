# dotpixi

新 dotfiles 管理(2025)

- pixi で pyproject.toml
- ArchLinux と Windows11
- python でシンボリックリンクの管理ツールを実装する
- `sync` directory を `$HOME` に見立てて、この配下にファイルを配置して git 管理する
- file を symlink して、directory を symlink しない方針

- TODO: $XDG_CONFIG_HOME と $APPDATA で設定を共有する(同じ内容を配置できる場合)

## memo

- ArchLinux ではじめの一歩

## bash `sync/.bashrc`

## neovim `sync/.config/nvim`

- 一から設定しなおし
- lazy の分割設定
- 0.11 スタイルの lsp 設定 
- lspconfig 使うが setup しない。手動で enable する
- mason 使う
- vim.lsp.completion

### lua_ls

### ruff & pyright

## yazi

neotree から乗り換え

## lazygit

fugitive から乗り換え
