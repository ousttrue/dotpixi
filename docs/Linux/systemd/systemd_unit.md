# unit

- @2019 [systemd のユニットファイルの作り方 | 晴耕雨読](https://tex2e.github.io/blog/linux/create-my-systemd-service)

| type    | system                  | user                   |
| ------- | ----------------------- | ---------------------- |
| package | /usr/lib/systemd/system | /usr/lib/systemd/user  |
| system  | /etc/systemd/system     | /etc/systemd/user      |
| user    |                         | ~/.config/systemd/user |

## user level

`~/.config/systemd/user/mpd.service`

- [systemd/ユーザー - ArchWiki](https://wiki.archlinux.jp/index.php/Systemd/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC#.E3.83.A6.E3.83.BC.E3.82.B6.E3.83.BC.E3.83.A6.E3.83.8B.E3.83.83.E3.83.88.E3.82.92.E6.9B.B8.E3.81.8F)
- [ユーザレベルで systemd のユニットファイルを書くときの注意点](https://zenn.dev/noraworld/articles/systemd-unit-files-user-level-tips)

```systemd
> cat /usr/lib/systemd/user/mpd.service
[Unit]
Description=Music Player Daemon
Documentation=man:mpd(1) man:mpd.conf(5)
After=network.target sound.target

[Service]
Type=notify
ExecStart=/usr/bin/mpd --systemd

# Enable this setting to ask systemd to watch over MPD, see
# systemd.service(5).  This is disabled by default because it causes
# periodic wakeups which are unnecessary if MPD is not playing.
#WatchdogSec=120

# allow MPD to use real-time priority 40
LimitRTPRIO=40
LimitRTTIME=infinity

# for io_uring
LimitMEMLOCK=64M

# Required in order for ProtectSystem= (and other sandboxing) to work
PrivateUsers=yes
# disallow writing to /usr, /bin, /sbin, ...
ProtectSystem=yes

# more paranoid security settings
NoNewPrivileges=yes
ProtectKernelTunables=yes
ProtectControlGroups=yes
RestrictAddressFamilies=AF_INET AF_INET6 AF_UNIX
RestrictNamespaces=yes

# Note that "ProtectKernelModules=yes" is missing in the user unit
# because systemd 232 is unable to reduce its own capabilities
# ("Failed at step CAPABILITIES spawning /usr/bin/mpd: Operation not
# permitted")

[Install]
WantedBy=default.target
```
