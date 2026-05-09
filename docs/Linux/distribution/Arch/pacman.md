# /etc/pacman.conf

- Color コメントイン
- 使わない種類をコメントアウト

```
Color

#[mingw64]
#Include = /etc/pacman.d/mirrorlist.mingw64
```

# mirror

- [MSYS2国内源 · GitHub](https://gist.github.com/elvisw/cc00088e9c8fd1c83aca)
- [msys2のミラーにjaistを使いたい - Qiita](https://qiita.com/yumetodo/items/94a80ca9d6171e9352a2)
  `/etc/pacman.d/mirrorlist`

```
$ pacman-mirrors --fasttrack 5
$ pacman -Syu
```
