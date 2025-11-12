
# 構成

いろんな構成がある

- 排他(hw alsa)
- hw device の activate 問題(boot, login, desktop session...etc). systemd

## alsa 直

```
+----+       +---+
|alsa|<-alsa-|app|
+----+       +---+
```

## alsa(dmix): pipewire: pulseaudio

```
+----+        +- user systemd -+
|alsa|dmix <- |+--------+      |    +---+
+----+        ||pipewire|pulse | <- |app|
              |+--------+      |    +---+
              +----------------+
```

```sh
systemctl --user enable wireplumber pipewire pipewire-pulse
```
