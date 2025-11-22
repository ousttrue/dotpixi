# config

- `XDG_CONFIG_HOME` => `~/.config`
- `XDG_CACHE_HOME` => `~/.cache`
- `XDG_DATA_HOME` => `~/.local/share`

## windows

- [Windows: Windowsに'XDG Base Directory'を導入する](https://zenn.dev/atsushifx/articles/winhack-environ-xdg-base)

## share

> Note that 'D:/msys64/mingw64/share' is not in the search path
> set by the XDG_DATA_HOME and XDG_DATA_DIRS
> environment variables, so applications may not
> be able to find it until you set them. The
> directories currently searched are:

- C:$HOME/.local/share
- D:/msys64/mingw64/share/
- D:/msys64/usr/local/share/
- D:/msys64/usr/share/

# application icon

https://wiki.archlinux.jp/index.php/%E3%82%A2%E3%82%A4%E3%82%B3%E3%83%B3

`xdg-icon-resource install`

1.  `$HOME/.icons` (後方互換性のため)
2.  `$XDG_DATA_DIRS/icons`
3.  `/usr/share/pixmaps`

- [Changing openbox's alt+tab menu icon / Applications & Desktop Environments / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?pid=2014805#p2014805)
  OpenBox ookisugiru icon

