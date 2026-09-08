https://flatpak.github.io/xdg-desktop-portal/

> xdg-desktop-portal depends on GLib and Flatpak

# backend

## gtk

`/usr/share/xdg-desktop-portal/portals/gtk.portal`

## wlr

`/usr/share/xdg-desktop-portal/portals/wlr.portal`

## kde

## gnome

## cosmic

## customize

`~/.config/xdg-desktop-portal/portals.conf`
`~/.config/xdg-desktop-portal/hyprland-portals.conf`

- @2025 [xdg-desktop-portalで特定の実装の使用を強制する – Memopad of server admin](https://memo.h2yk.dev/xdg-desktop-portal-config/)

# interface

`dbus` で通信する？

## FileChooser

## Screenshot

## ScreenCast

## Settings

## Notification

## OpenURI

## Camera

## GlobalShortcuts

## Secret

# restart

```sh
#!/bin/sh
sleep 1
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
```

# backup

[XDG - ArchWiki](https://wiki.archlinux.jp/index.php/XDG_)%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97\_%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%AB

[XDG Desktop Portal](https://flatpak.github.io/xdg-desktop-portal/)

- [GitHub - flatpak/xdg-desktop-portal: Desktop integration portal](https://github.com/flatpak/xdg-desktop-portal)
- [XDG Desktop Portal documentation](https://flatpak.github.io/xdg-desktop-portal/docs/)

- @2022 [xdg-desktop-portal – Jan Grulich](https://jgrulich.cz/tag/xdg-desktop-portal/)
- [FirefoxやLibreOfficeの起動が遅い #Linux - Qiita](https://qiita.com/YuH25/items/162ed34bc4257372c48f)

## setup

- https://wiki.archlinux.jp/index.php/XDG_%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97_%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%AB

## xdg-open

- https://github.com/flatpak/xdg-desktop-portal/issues/648

## dbus

- [Portal API Reference — Flatpak documentation](https://docs.flatpak.org/en/latest/portal-api-reference.html)

## arch

- [XDG デスクトップ ポータル - ArchWiki](https://wiki.archlinux.jp/index.php/XDG_%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97_%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%AB)
- @2023 [業務端末としてLinuxデスクトップを使うために設定したこと - Plan 9とGo言語のブログ](https://blog.lufia.org/entry/2022/01/18/203946)

## Chromium

- [modules/desktop_capture/linux/xdg_desktop_portal_base.cc - src - Git at Google](https://webrtc.googlesource.com/src/+/3fb94a488c7ad1cd42be3072584a676784dde662/modules/desktop_capture/linux/xdg_desktop_portal_base.cc)

## gnome

[GNOME / xdg-desktop-portal-gnome · GitLab](https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome)

- @2020 [Screen and window sharing over webrtc - Desktop - GNOME Discourse](https://discourse.gnome.org/t/screen-and-window-sharing-over-webrtc/3189)

## screen sharing

- [Wayland の Electron アプリで画面共有する · GitHub](https://gist.github.com/buzztaiki/eab0f1f94868674a9eaf6b5d03d7a79f)
- [Waylandで動くタイル型ウィンドウマネージャ・swayを使う](https://zenn.dev/haxibami/articles/wayland-sway-install#%E7%94%BB%E9%9D%A2%E5%85%B1%E6%9C%89)
