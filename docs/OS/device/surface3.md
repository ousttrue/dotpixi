# surface3

- https://support.microsoft.com/ja-jp/help/4023511/surface-boot-surface-from-a-usb-device
- http://songoku.shenron.jp/Windows/Windows022/Windows022-004.html

```
１: Surface をシャットダウン。
２: Surface の電源がオフになったら、音量を上げるボタンを長押し。
３: 音量を上げるボタンを押したまま、電源ボタンを押して離す。
４: Surface のロゴが画面に表示されなくなるまで、音量を上げるボタンを押し続ける。
Surface UEFI が表示されるので。次のいずれかを実行。
```

# linux_surface_pro3

## wifi device

```
02:00.0 Ethernet controller: Marvell Technology Group Ltd. 88W8897 [AVASTAR] 802.11ac Wireless
        Subsystem: Device 0003:045e
        Kernel driver in use: mwifiex_pcie
        Kernel modules: mwifiex_pcie
```

```
pacman -S linux-firmware-marvell

pacman -S iwd
```
