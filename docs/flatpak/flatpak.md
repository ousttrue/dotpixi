- https://wiki.archlinux.jp/index.php/Flatpak
- `user` [Flatpakインストール周りの整理・まとめ](https://zenn.dev/ykesamaru/articles/c3afb6097ca48a)

`~/.local/share/flatpak`

# install

## arch

```sh
sudo pacman -S flatpak xdg-desktop-portal xdg-utils
```

# remote

## remotes(remote-list)

```sh
> flatpak remotes
Name    Options
flathub system
> flatpak --user remotes
```

## remote-add

```
# システムレベルでのリモートリポジトリ追加
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ユーザーレベルでのリモートリポジトリ追加
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

