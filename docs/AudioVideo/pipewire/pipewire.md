https://pipewire.org/

- https://docs.pipewire.org/

# version

- https://blogs.gnome.org/uraeus/2020/09/04/pipewire-late-summer-update-2020/

## 1.4 @202511

## 1.2

# config

```sh
cp /usr/share/pipewire/pipewire.conf ~/.config/pipewire/pipewire.conf 

```

# trouble

```sh
> wpctl status
Could not connect to PipeWire

> systemctl --user status pipewire
× pipewire.service - PipeWire Multimedia Service
     Loaded: loaded (/usr/lib/systemd/user/pipewire.service; enabled; preset: enabled)
     Active: failed (Result: exit-code) since Tue 2026-01-13 20:05:23 JST; 16min ago
   Duration: 61ms
 Invocation: 9a6f57f86cd84122b6c8d1a749249bfa
TriggeredBy: × pipewire.socket
   Main PID: 28645 (code=exited, status=240/LOGS_DIRECTORY)
   Mem peak: 2.2M
        CPU: 54ms

Jan 13 20:05:23 arch systemd[757]: pipewire.service: Scheduled restart job, restart counter is at 6.
Jan 13 20:05:23 arch systemd[757]: pipewire.service: Start request repeated too quickly.
Jan 13 20:05:23 arch systemd[757]: pipewire.service: Failed with result 'exit-code'.
Jan 13 20:05:23 arch systemd[757]: Failed to start PipeWire Multimedia Service.
```

```sh
> systemctl --user enable --now pipewire pipewire-pulse
```

# setup

## user

```~/.config/pipewire/pipewire.conf
context.objects = [
    { factory = adapter
       args = {
           factory.name           = api.alsa.pcm.sink
           node.name              = "alsa-sink"
           node.description       = "PCM Sink"
           media.class            = "Audio/Sink"
           api.alsa.path          = "dmix:AMPLIFIER,0"
       }
    }
]
```

## arch linux

```sh
sudo pacman -S pipewire pipewire-audio pipewire-pulse pipewire-alsa wireplumber
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```

# session manager

## pipewire-media-session.service

> 現在は非推奨となり、WirePlumberに取って代わられました

# sink を決める

https://www.katsuster.net/index.php?arg_act=cmd_show_diary&arg_date=20251011

```sh
$ wpctl status
```

# rtkit

https://forums.gentoo.org/viewtopic-t-1168313-start-0.html

# pulseaudio (piewire backend)

`(pulseaudio) => pipewire => alsa`

```sh
pactl info | grep "Server Name"
```

https://bbs.archlinux.org/viewtopic.php?id=296995

```sh
$ systemctl --user enable --now pipewire-pulse.socket

$ pactl info
Server String: /run/user/1000/pulse/native
Library Protocol Version: 35
Server Protocol Version: 35
Is Local: yes
Client Index: 71
Tile Size: 65472
User Name: ousttrue
Host Name: gent
Server Name: PulseAudio (on PipeWire 1.4.8)
Server Version: 15.0.0
Default Sample Specification: float32le 2ch 48000Hz
Default Channel Map: front-left,front-right
Default Sink: alsa_output.usb-FOSTER_Elec._CO.__LTD_PERSONAL_AMPLIFIER-01.analog-stereo
Default Source: alsa_output.usb-FOSTER_Elec._CO.__LTD_PERSONAL_AMPLIFIER-01.analog-stereo.monitor
Cookie: 6fa4:3fff
```

# alsa (pipewire backend)

https://pipewire.org/

- https://wiki.gentoo.org/wiki/PipeWire/ja

- @2025 [PipeWire徹底解説：LinuxマルチメディアアーキテクチャをOSエンジニアリングの観点から読み解く #pulseaudio - Qiita](https://qiita.com/shinonome_taku/items/d7b396de3174d5c24404)

`libpipewire-module-portal`

- [PipeWire](https://pipewire.org/)
  - [PipeWire: PipeWire](https://docs.pipewire.org/index.html)
- [Jonas Ådahl / gnome-remote-desktop · GitLab](https://gitlab.gnome.org/jadahl/gnome-remote-desktop)
- [PipeWire - Gentoo Wiki](https://wiki.gentoo.org/wiki/PipeWire)

[[obs]]

- @2022 [PipeWire とJACKサーバーの音を比較した感想(Pop!\_OSとDeadBeef) - meotoblog](https://www.gustavprogress.com/pipewire-%E3%81%A8jack%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC%E3%81%AE%E9%9F%B3%E3%82%92%E6%AF%94%E8%BC%83%E3%81%97%E3%81%9F%E6%84%9F%E6%83%B3pop_os%E3%81%A8deadbeef/)
- @2022 [アプリケーションの音をPipewire経由してOBSでキャプチャする | Days of speed](https://www.nofuture.tv/capture-app-sounds-with-obs-via-pipewire)

- @2021 [Debian 11 に PipeWire をインストールしてみた: LinuxでCD音楽再生 Debian編](http://kanzou5.seesaa.net/article/483841659.html)
- @2021 [Ubuntu 21.04 で PipeWire オーディオ サービスを有効にして PulseAudio を置き換える方法 - WebSetNet](https://websetnet.net/ja/how-to-enable-pipewire-audio-service-to-replace-pulseaudio-in-ubuntu-21-04/)
- @2021 [Debian bullseyeでPipeWireに切り替えてPulseAudioに戻したらA2DPが使えなくなった – matoken's meme](https://matoken.org/blog/2021/12/16/debian-bullseye-can-no-longer-use-a2dp/)

# trouble

```
[E] pw.loop [loop.c:67 pw_loop_new()] 0x5562ee230bf0: can't make support.system handle: No such file or directory
```
