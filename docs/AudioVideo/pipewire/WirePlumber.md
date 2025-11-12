https://wiki.archlinux.jp/index.php/WirePlumber

`pipewire` の `session manager`

> PipeWire Media Session `deprecated` の後継

# version

```sh
wpctl status
wpctl inspect 48
```

## 0.5

- https://www.reddit.com/r/debian/comments/1cvdijl/heads_up_debian_trixie_wireplumber_05_alsa/?tl=ja

- [PipeWire徹底解説：LinuxマルチメディアアーキテクチャをOSエンジニアリングの観点から読み解く #pulseaudio - Qiita](https://qiita.com/shinonome_taku/items/d7b396de3174d5c24404)
  > Luaスクリプトでしたが、設定の多くが.confファイル形式に移行

## 0.4

- `/usr/share/wireplumber/wireplumber.conf` が lua

# restart

```sh
systemctl --user restart wireplumber.service
```

# monitor alsa

- https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/alsa.html

> creating PipeWire devices and nodes for all the ALSA cards that are available on the system

- https://www.reddit.com/r/linuxaudio/comments/1j8lrqp/how_to_set_audio_bit_depth_to_fp32le_in_pipewire/?tl=ja
