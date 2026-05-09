https://github.com/soficshifts/conky-lua-cairo/blob/main/cpu.conf

# version

https://github.com/brndnmtthws/conky/releases

## 1.22 @2025 `wayland`

- @2026 [[ほぼ自分用] cachyos設定 Conky篇｜よしあ](https://note.com/yoshix3/n/n828ae8422d21)
  - [Sirius - Conky theme - pling.com](https://www.pling.com/p/1854716)

## 1.21 @2024

## 1.18, 19 @2023

## 1.13, 14, 15, 16 @2022

## 1.12 @2021

- @2021 `conky-draw` [Conkyで円グラフとか簡単に作るconky-drawを紹介してみる。 - Qiita](https://qiita.com/yasunori-kirin0418/items/0c681d9861609cfb7acd)
- @2020 [GitHub - algon-320/tenki: tenki.jpから天気を取得してターミナルに表示します。](https://github.com/algon-320/tenki)
- @2019 `clock` `calendar` `network` [conky の設定を晒す<-コンピュータ<-徒然なるままに<-Iranoan](http://iranoan.my.coocan.jp/essay/pc/201903160.htm)

## 1.11 @2018

## 1.10 @2015 `lua`

- @2015 [Release Conky 1.10.0 · brndnmtthws/conky · GitHub](https://github.com/brndnmtthws/conky/releases/tag/v1.10.0)
- @2015 [第391回　ConkyでデスクトップPCの情報をモニタリングする：Ubuntu Weekly Recipe｜gihyo.jp … 技術評論社](https://gihyo.jp/admin/serial/01/ubuntu-recipe/0391)

# configuration

- [Configurations · brndnmtthws/conky Wiki · GitHub](https://github.com/brndnmtthws/conky/wiki/Configurations)

```
$ mkdir -p ~/.config/conky
$ conky -C > ~/.config/conky/conky.conf
```

## lua

`from 1.10`

## wayland wlr-layer-shell

https://github.com/brndnmtthws/conky/wiki/Window-Configuration

```lua title="~/.config/conky/conky.conf"
conky.config = {
    out_to_x = false,
    out_to_wayland = true,
};
```

## not lua

`/etc/conky/conky.conf`
