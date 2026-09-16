# surface4

- https://support.microsoft.com/ja-jp/help/4023511/surface-boot-surface-from-a-usb-device
- http://songoku.shenron.jp/Windows/Windows022/Windows022-004.html

```
１: Surface をシャットダウン。
２: Surface の電源がオフになったら、音量を上げるボタンを長押し。
３: 音量を上げるボタンを押したまま、電源ボタンを押して離す。
４: Surface のロゴが画面に表示されなくなるまで、音量を上げるボタンを押し続ける。
Surface UEFI が表示されるので。次のいずれかを実行。
```

# Linux

- `Mint` @2025 [💻Surface Pro 4に初めてのLinux OS導入｜AERO](https://note.com/happyskylifezzz/n/n98fd65f42e52)

## debian

- @2025 [SrfacePro4にDebian12を入れたときにやったこと](https://zenn.dev/crackworks/articles/5200611d329fd0)
- https://www.reddit.com/r/SurfaceLinux/comments/3z6g9g/installing_debian_on_the_microsoft_surface_pro_4/

## ubuntu

- @2019 [Surface Pro 4でlubuntu 18.04を使う - turgenev’s blog](https://turgenev.hatenablog.com/entry/2019/01/17/004545)
- @2018 [Surface Pro 4にUbuntu 16.04 LTSを導入する #Linux - Qiita](https://qiita.com/Jies_/items/9774ddd55d6b2070c268)

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
