- @2021 [Linuxで高音質Bluetoothを使う（AAC,aptX,LDAC） - おのかちお's blog](https://blog.katio.net/page/linux-bluetooth)
- https://www.reddit.com/r/hardware/comments/u27i3w/notable_recent_bluetooth_53_certified_products/?tl=ja

# Version

- [Linux で Bluetooth バージョンを確認する #bluetooth - Qiita](https://qiita.com/teruo-oshida/items/dbf56efa32042c7c12e2)

## 6.0

- [Bluetooth 6.0の新機能まとめ | 電子部品・半導体商社のネクスティエレクトロニクス（NEXTY Electronics）](https://www.nexty-ele.com/technical-column/bluetooth_04/)

## 5.4

## 5.3

## 5.2

- [Bluetoothの『バージョン』とは？5.2の進化ポイント「オーディオ機能」などを解説｜KDDI トビラ](https://time-space.kddi.com/ict-keywords/20190909/2738)

## 5.0

> 2017年に登場したBluetooth 5

## 4.2

> 2019年現在Bluetooth 4.2がスタンダード

# device

- https://www.musen-connect.co.jp/blog/course/trial-production/bluetooth5/
- [realtekのRTL8761Bのbuetooth5.0アダプタの動作確認: okoyaの私的メモ](https://okoya.seesaa.net/article/479453801.html)
- `CSR` [Bluetooth (BLE) アダプタをUbuntuやRaspberry Piで使う | DIY Smart Matter](https://diysmartmatter.com/archives/360)

## `5.4` RTL8761CUV

- @2026 [Bluetoothドングル BSBT54D205BKをUbuntu24.04で使う - mdevのブログ](https://mdev.hatenablog.com/entry/2026/07/26/132756)

## `5.x` RTL8761B

- @2023 [Realtek RTL8761B の Bluetooth 5 USB ドングルを Linux で動かす #bluetooth - Qiita](https://qiita.com/aryta/items/86b3b1287629611efce1)
- [Linux Mint(3) Bluetooth5.0対応ドングルを使ってみる | Bookman's Log](https://hibikore.net/memo/linux-mint3-bluetooth5-0/)
- `重要!` [Ubuntu 22.04でTP-LinkのBluetoothアダプタUB500を動かす | ごちゃまぜの音 ](https://jumble-note.blogspot.com/2023/08/linux-ubuntu-2204tp-linkbluetoothub500.html)

```sh
$ cd /lib/firmware/rtl_bt
$ sudo mv rtl8761bu_config.bin rtl8761bu_config.bin.old
$ sudo mv rtl8761bu_fw.bin rtl8761bu_fw.bin.old
$ sudo ln -s rtl8761b_config.bin rtl8761bu_config.bin
$ sudo ln -s rtl8761b_fw.bin rtl8761bu_fw.bin
```

- [IO DATA製のUSB BluetoothドングルをLinuxに買ってみた | お写んぽとアコギな日々 - 楽天ブログ](https://plaza.rakuten.co.jp/beach3/diary/202209220000/)

## RTL8821C

## EFR32BG21

## nRF52832

# bluez

- [PCのBluetoothバージョンを確認するコマンド(Arch Linuxを例に) - 拾い物のコンパス](https://poppycompass.hatenablog.jp/entry/2020/06/13/143424)
- `BLE` [Bluetoothのはなし(4)｜Wireless・のおと｜サイレックス・テクノロジー株式会社](https://www.silex.jp/library/blog/20131226-1)
