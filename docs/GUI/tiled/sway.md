[Sway](https://swaywm.org/)
[Sway - ArchWiki](https://wiki.archlinux.jp/index.php/Sway)

# ~/.config/sway/config

```sh
$ copy /etc/sway/config ~/.config/sway/config
```

# keymap

- [Arch Linuxにタイル型WaylandコンポジタSwayを導入する | クロの思考ノート](https://note.kurodigi.com/archlinux-sway/)

| MOD       |                      |
| --------- | -------------------- |
| shift + c | 設定ファイルの再読込 |
| shift + e | swayを終了           |

## open / close

| MOD       |                    |
| --------- | ------------------ |
| Enter     | ターミナルを開く   |
| d         | ランチャーを開く   |
| shift + q | ウィンドウを閉じる |

## focus

| MOD |                        |
| --- | ---------------------- |
| j   | (or ↓) 下にフォーカス  |
| k   | (or ↑) 上にフォーカス  |
| h   | (or ←) 左にフォーカス  |
| l   | (or →) 右にフォーカス  |
| a   | 親コンテナにフォーカス |

## window move

| MOD         |                                    |
| ----------- | ---------------------------------- |
| shift + j   | (or ↓) 下に移動                    |
| shift + k   | (or ↑) 上に移動                    |
| shift + h   | (or ←) 左に移動                    |
| shift + l   | (or →) 右に移動                    |
| shift + 1~9 | ウィンドウを各ワークスペースに移動 |

## window etc

| MOD |                          |
| --- | ------------------------ |
| r   | ウィンドウのリサイズ     |
| f   | フルスクリーンの切り替え |
| v   | 垂直にウィンドウを分割   |
| b   | 水平にウィンドウを分割   |

## workspace

| MOD |                        |
| --- | ---------------------- | --- |
| 1~9 | 各ワークスペースに移動 | #   |

## float

| MOD           |                                        |
| ------------- | -------------------------------------- |
| space         | フロートエリアとタイルエリアの切り替え |
| shift + space | フロートモードの切り替え               |

## layout

| MOD |                            |
| --- | -------------------------- |
| e   | タイル型レイアウトに変更   |
| s   | スタック型レイアウトに変更 |
| w   | タブ型レイアウトに変更     |

# articles

- `for_window` `scaling` @2021 [Waylandで動くタイル型ウィンドウマネージャ・swayを使う](https://zenn.dev/haxibami/articles/wayland-sway-install)
- `wofi` @2021 [swayでwayland:daglog](https://aodag.dev/posts/2021-12-16-sway/)
- @2020 [Sway を導入した | aobako.net](https://aobako.net/linux/sway/intro/)
- `waybar` `rofi` @2019 [swayのすゝめ | inthisfucking.world](https://inthisfucking.world/sway/)
  way

# acch

```
Optional dependencies for sway
    dmenu: dmenu_path support (used alongside wmenu in default $menu)
    foot: Terminal emulator used in the default configuration [installed]
    i3status: Status line generation
    mako: Lightweight notification daemon
    polkit: System privilege control. Required if not using seatd service [installed]
    swaybg: Wallpaper tool for sway
    sway-contrib: Collection of user-contributed scripts for sway
    swayidle: Idle management daemon
    swaylock: Screen locker
    waybar: Highly customizable bar [installed]
    wmenu: Application launcher used in default config
    xorg-xwayland: X11 support [installed]
    xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking
    xdg-desktop-portal-wlr: xdg-desktop-portal backend

```

# bar

## sway-bar

[sway-bar(5) — Arch manual pages](https://man.archlinux.org/man/sway-bar.5)

## waybar

[[waybar]]

# menu / launcher

## wofi

## rofi

## dmenu

# notfication

# layout

## tile

## stack

vertical tab ?

## tab

horizontal tab ?
