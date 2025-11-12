https://pipewire.org/

- https://docs.pipewire.org/

# version

- https://blogs.gnome.org/uraeus/2020/09/04/pipewire-late-summer-update-2020/

## 1.4 @202511

## 1.2

# xdg-desktop-portal

https://wiki.gentoo.org/wiki/XDG/xdg-desktop-portal

# bluetooth

- LDAC、aptX

# libpipewire

> ユーザーセッションごとに1つのPipeWireデーモンが存在し、Unixドメインソケット

- Unixソケット上のIPC（カスタムプロトコルを使用）を介してデーモンと通信

# objects

Device、Factory

## node

### AudioSource

### AudioSink

- Bluetoothヘッドセット

### AudioStream

### VideoCapture

# session manager

## pipewire-media-session.service

> 現在は非推奨となり、WirePlumberに取って代わられました

# libpipewire-module-portal

# pipewire-pulse

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
