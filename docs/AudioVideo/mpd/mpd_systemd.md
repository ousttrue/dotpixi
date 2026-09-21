セットアップに３種あり

# System

- Desktop ログインと連動させない
- music server として service を起動しっぱなしにする
- Speaker を遠隔操作する感じになるのに注意

`/etc/mpd.conf`

- @2020 `pulseaudio` [Raspberry piをNAS兼音楽プレイヤーにする(MPD編) – ぷちのいず](https://petit-noise.net/blog/built-up-nas-and-music-server-on-the-rpi-part2/)

- ユーザーは `mpd` でよい。

`/etc/systemd/system/pulseaudio.service`

## service

```ini
[Unit] 
Description=Pulse Audio 

[Service] 
Type=simple 
ExecStart=/usr/bin/pulseaudio --system --disallow-exit --disable-shm

[Install]
WantedBy=multi-user.target
```

# User

`/.config/mpd/mpd.conf`

## desktop session

`デフォルト`

- Desktop ログインと連動する
- Loginユーザーが Spearker を支配する
- @2022 [ music player daemon:daglog ](https://aodag.dev/posts/2022-12-09-mpd/)

## service

- @2017 [サーバー起動時に非rootユーザーでsystemdを使ってサービスを立ち上げる #systemd - Qiita](https://qiita.com/k0kubun/items/3c94473506e0e370a227)
- @2024 [ユーザー固有のジョブの登録と起動 - megutech](https://megu-tech.hatenablog.com/entry/2024/07/04/114608)

### user の自動ログイン

- https://wiki.archlinux.jp/index.php/Systemd/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC#systemd\_%E3%81%AE%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9%E3%82%92%E8%87%AA%E5%8B%95%E8%B5%B7%E5%8B%95

```sh
$ sudo loginctl enable-linger username
```

> Session が破壊される

のでよろしくない？
