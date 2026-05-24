- https://wiki.gentoo.org/wiki/OpenRC_to_systemd_Cheatsheet/ja

- @2023 [systemctlとsysctlの違い #初心者 - Qiita](https://qiita.com/For_Whom_The_Alarm_Tolls/items/e1b7bc6b630f74f78f63)
- @2019 [これからSystemd入門する - Qiita](https://qiita.com/bluesDD/items/eaf14408d635ffd55a18)

`initプロセス`

> systemdはカーネルによって最初に起動されるプログラムです。一番最初に起動するのでプロセスIDは１です。

`systemctl` が systemd。`sysctrl` はカーネル機能。

# systemctl

- @2017 [systemctl コマンド - Qiita](https://qiita.com/sinsengumi/items/24d726ec6c761fc75cc9)

# WSL

- [「Windows Subsystem for Linux」が「systemd」に対応へ - 窓の杜](https://forest.watch.impress.co.jp/docs/news/1441775.html)
- @2022 [Distrodを使うのをやめました - @ledsun blog](https://ledsun.hatenablog.com/entry/2022/10/28/182104)

```
# /etc/wsl.conf
[boot]
systemd=true
```

## Ubuntu

`genie`

- @2022 [【WSL2】systemctlが動かない問題をきちんと解決する | しきゆらの備忘録](https://shikiyura.com/2020/06/execute_systemctl_on_wsl2/)

## Arch

`distord`

- @2021 [Arch Linux on WSL2 で systemd を動かす - gifnksmの雑多なメモ](https://gifnksm.hatenablog.jp/entry/2021/01/02/183830)
