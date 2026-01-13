https://www.alsa-project.org/wiki/Main_Page

# devices

```sh
> aplay -L
> aplay --list-devices
```

```
$ cat /sys/class/sound/card*/id
```

```sh
> cat /proc/asound/cards
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xdf240000 irq 137
 1 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0xdf080000 irq 17
 2 [AMPLIFIER      ]: USB-Audio - PERSONAL AMPLIFIER
                      FOSTER Elec. CO., LTD PERSONAL AMPLIFIER at usb-0000:00:14.0-4, full speed
```

`hw:0,0`

# config

- https://www.alsa-project.org/wiki/Asoundrc
- https://gist.github.com/fd0/ddc3ad21e1ae77242628

`/etc/asound.conf` or `~/.asoundrc`

```
pcm.primary {
	type hw
	card 0
	device 0
}
```

```
# `!default` は predefined な名前。
# `default` とすれば通常の名前。

pcm.!default {
	type hw
	card 0
}

ctl.!default {
	type hw
	card 0
}
```

# test

- [Linuxで音声の出力先をUSBスピーカーにする #RaspberryPi - Qiita](https://qiita.com/nobwak/items/a104640c5c0702486f6c)
- https://askubuntu.com/questions/810815/ubuntu-16-04-hdmi-audio-not-working-speaker-test-works

```sh
$ speaker-test -Dhw:MicroII
$ speaker-test -Dplughw:MicroII
$ speaker-test -Dhw:1,3
```

channel 

```
Channels count (1) not available for playbacks: Invalid argument
Setting of hwparams failed: Invalid argument

$ speaker-test -c 2 -Dhw:2,0
```

# alsamixer

- `M` でミュート切り替え
