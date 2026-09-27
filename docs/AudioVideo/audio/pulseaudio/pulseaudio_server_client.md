remote の speaker server に client から送る。

通常は `systemd --user` の service として、ログインセッション下になる。

- [PulseAudioをsystem serviceとして動かす #Linux - Qiita](https://qiita.com/fujiba/items/9f90e90d5e9366ec8483)

# server

system daemon

`/etc/pulse/system.pa`

# client


```
# ~/.config/pulse/client.conf
# 違うファイル?
default-server = server_hostname_or_ip
```

- [PulseAudioを使って別のLinuxサーバーのスピーカーから音を再生したい - 動かざることバグの如し](https://blog.turai.work/entry/20240421/1713661314)

```sh
$ pacmd load-module module-tunnel-sink server=192.168.16.16
```

```
# /etc/pulse/client.conf.d/my.conf
default-server = server_hostname_or_ip
```

- https://www.katsuster.net/index.php?arg_act=cmd_show_diary&arg_date=20251011

