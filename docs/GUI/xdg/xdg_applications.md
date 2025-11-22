# path

`~/.local/share/applications`

# update

```sh
$ update-desktop-database ~/.local/share/applications
```

# desktop

- [デスクトップエントリ - ArchWiki](https://wiki.archlinux.jp/index.php/%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%82%A8%E3%83%B3%E3%83%88%E3%83%AA)
  `~/.local/share/applications`
- [xdg-open で開くアプリを変更する - Qiita](https://qiita.com/apu4se/items/ff7efd8d351e09bb9b54)
- @2018 [デフォルトブラウザを変更する – あららぼ](https://ararabo.jp/2018-07-27/?p=7401)

`~/.local/share/applications/wezterm.desktop`

```ini
[Desktop Entry]
Name=WezTerm
Comment=Wez's Terminal Emulator
Keywords=shell;prompt;command;commandline;cmd;
Icon=path_to.png
StartupWMClass=org.wezfurlong.wezterm
TryExec=wezterm
Exec=wezterm start --cwd .
Type=Application
Categories=System;TerminalEmulator;Utility;
Terminal=false
```
