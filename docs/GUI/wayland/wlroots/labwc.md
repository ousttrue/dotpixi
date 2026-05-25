https://labwc.github.io/index.html

# version

## 0.9.7

## 0.8.4

https://www.reddit.com/r/labwc/comments/1l1waty/hide_mouse_pointer/

# articles

- @2024 [Void LinuxにLabwcで軽量で実用性の高いWaylandデスクトップ環境を構築する | クロの思考ノート](https://note.kurodigi.com/void-labwc/)
- @2024 [ラズパイbookwormの次世代軽量デスクトップlabwc - 日本語を設定、ついでにワークスペースも設定する | Yagifulのブログ](https://yagiful.com/blog/raspi-bookworm-labwc-japanese/)

# action / keybinds

- https://labwc.github.io/labwc-actions.5.html
- https://labwc.github.io/labwc-config.5.html#entry_keyboard_default

# theme

https://labwc.github.io/labwc-theme.5.html

- https://fedoranize.seesaa.net/article/520151120.html

`~/.config/labwc/themerc-override`

```
window.active.title.bg.color: #9D8D31
menu.title.bg.color: #9D8D31
menu.title.text.color: #ffffff
menu.items.active.bg.color: #589bda
menu.items.active.text.color: #000000
```

## archlinux

`/usr/share/themes/README.md`

# libinput

## Disable While Typing (DWT)

- `udev` [Linuxでキーボード入力中に外部トラックパッドを無効化 #Keyboard - Qiita](https://qiita.com/s417-lama/items/a2058db61d16c5804dd2)
- [タイピング中にタッチパッドを無効にする(Linux/Libinput) - iberianpigsty](https://blog.iberianpig.dev/posts/2018-07-15_disable_while_typing/)

# libseat

ly などの login manager を使えば自動。

```sh
$ sudo pacman -S seatd
$ sudo systemctl start seatd
# group seat
```
