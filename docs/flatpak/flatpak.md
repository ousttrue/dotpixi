- https://wiki.archlinux.jp/index.php/Flatpak
- `user` [Flatpakインストール周りの整理・まとめ](https://zenn.dev/ykesamaru/articles/c3afb6097ca48a)

`~/.local/share/flatpak`

# install

## arch

```sh
sudo pacman -S flatpak xdg-desktop-portal xdg-utils
```

# command line

- https://discussion.fedoraproject.org/t/how-to-add-cli-parameter-to-flatpak-application-startup/143076

```sh
> flatpak list --app
Name                 Application ID           Version                Branch        Installation
Google Chrome        com.google.Chrome        148.0.7778.96-1        stable        system
Slack                com.slack.Slack          4.49.89                stable        system
> flatpak info --show-location com.google.Chrome
/var/lib/flatpak/app/com.google.Chrome/x86_64/stable/XXX
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

