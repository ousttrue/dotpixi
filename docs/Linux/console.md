`80x25`

`640x400(8x16)`

- [Linux Server のコンソール画面を広くして視認性をアップさせる #Ubuntu - Qiita](https://qiita.com/fkshom/items/f1aea4b7cd93b7cbf848)
- [Linuxコンソール解像度設定完全ガイド：GRUBからGRUB2まで - acoustype.com](https://acoustype.com/2025/10/14/linux-console-resolution-guide/)

# grub

- [低解像度のモニターをLinuxで使う方法 - コンピューター好きのブログ](https://www.toomath.net/entry/2019/08/20/use-low-resolution-display-for-linux)

# console

Linux の X を起動する前の黒い画面
`/dev/console`

- VGA 80x25
- showconsolefont
- setfont lat2-16 -m 8859-2 - `/usr/share/kbd/consolefonts/`
  `/etc/vconsole.conf`

# framebuffer

- `vga=795 fbcon=rotate:3` [ Linux コンソールを 回転モニターで利用する方法。 - silver::arrow::diary](https://silver-arrow.hatenadiary.org/entry/20071115/p1)

# kmscon

- [kmscon](https://www.freedesktop.org/wiki/Software/kmscon/)

# keymap

- [Arch Linux をおしゃれに最速インストール - おしゃれな気分でプログラミング](http://neko-mac.blogspot.com/2021/05/arch-linux.html)

```
# mkdir -p /usr/local/share/kbd/keymaps
# cp /usr/share/kbd/keymaps/i386/qwerty/us.map.gz /usr/local/share/kbd/keymaps/
# cd /usr/local/share/kbd/keymaps/
# gunzip us.map.gz
# mv us.map my_custom_us.map
# vim my_custom_us.map

keycode  58 = Control

/etc/vconsole.conf
KEYMAP=/usr/local/share/kbd/keymaps/us_custom.map
```
