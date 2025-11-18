# version

## 6.5

- https://gihyo.jp/article/2025/10/daily-linux-251022

# arch install

```sh
pacman -S seatd plasma konsole
```

# skk

fcitx5-skk を野良ビルドして /usr/local に入った so が not found になっていた。
/etc/ldd.so.conf で解決できそうな気もするが、
シンボリックリンクで応急処置した。

```sh
> ldd /usr/lib64/fcitx5/skk.so | rg skk
        libskk.so.0 => /usr/lib64/libskk.so.0 (0x00007fdc0e10b000)
> ldd /usr/lib64/fcitx5/qt6/libfcitx5-skk-config.so | rg skk
        libskk.so.0 => /usr/lib64/libskk.so.0 (0x00007f44848a4000)
```

`202511` plasma6 設定左列の `input method` は必要なかった。`kcm` ?
