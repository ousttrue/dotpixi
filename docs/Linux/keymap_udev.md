- [Wayland でお好みのキーバインド - bearmini's blog](https://bearmini.hatenablog.com/entry/2023/12/03/134330)

# 調べる

```sh
sudo evtest

cat /sys/class/input/event19/device/modalias
```

# hwdb

`/etc/udev/hwdb.d/10-mykeyboard.hwdb`

| vendor   |                               |                           |
| -------- | ----------------------------- | ------------------------- |
| lenovo   | b0003v17EFp619E*              |                           |
| Keychron | b0003v3434p071A*              |                           |
| skb      | b0003v1C4Fp0027*              |                           |
| apple    | b0003v05ACp029C version 0x110 | Apple Inc. Magic Keyboard |

- `evdev:input:b0003v258Ap002Ae*` はマッチしないぽい
- `b大文字hex` `v大文字hex` `p大文字hex` であることに注意!

```ini
# Input device ID: bus 0x3 vendor 0x258a product 0x2a version 0x111
# Input device name: "SINO WEALTH Gaming KB"
# cat /sys/class/input/event4/device/modalias
evdev:input:b0003v258Ap002A*
  KEYBOARD_KEY_70039=leftctrl
```

magic keyboard2

```ini
# [ff0003][ctrl][700e2][700e3]space[700e7][700e6]
evdev:input:b0003v05ACp029C*
 KEYBOARD_KEY_70039=leftctrl
 KEYBOARD_KEY_ff0003=leftctrl
 KEYBOARD_KEY_700e2=leftmeta
 KEYBOARD_KEY_700e3=leftalt
 KEYBOARD_KEY_700e7=rightalt
 KEYBOARD_KEY_700e6=rightmeta
```

# 反映

```sh
sudo systemd-hwdb update
sudo udevadm trigger
```

