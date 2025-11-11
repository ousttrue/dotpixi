https://www.alsa-project.org/wiki/Main_Page

# asoundrc

https://www.alsa-project.org/wiki/Asoundrc

`/etc/asound.conf` or `~/.asoundrc`

## card & device

`hw:0,0`

```sh
cat /proc/asound/cards
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xdf240000 irq 137
 1 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0xdf080000 irq 17
 2 [AMPLIFIER      ]: USB-Audio - PERSONAL AMPLIFIER
                      FOSTER Elec. CO., LTD PERSONAL AMPLIFIER at usb-0000:00:14.0-6, full speed
```

```alias
pcm.primary {
	type hw
	card 0
	device 0
}
```

```
pcm.!default {
	type hw
	card 0
}

ctl.!default {
	type hw           
	card 0
}
```

`!default` は predefined な名前。
`default` とすれば通常の名前。

```
# /etc/asound.conf
# ~/.asoundrc
defaults.pcm.!card pulse
defaults.pcm.!device 0
defaults.ctl.!card pulse
```

- https://gist.github.com/fd0/ddc3ad21e1ae77242628



## test

```sh
$ speaker-test -c 2
```

[Linuxで音声の出力先をUSBスピーカーにする #RaspberryPi - Qiita](https://qiita.com/nobwak/items/a104640c5c0702486f6c)

```sh
$ speaker-test -Dplughw:MicroII
```

- https://askubuntu.com/questions/810815/ubuntu-16-04-hdmi-audio-not-working-speaker-test-works

```sh
$ speaker-test -Dhw:1,3
```

# 動作確認

```
$ aplay -L
$ cat /sys/class/sound/card*/id
$ aplay --list-devices
```

- alsamixer `M` でミュート切り替え

