LXD の Fork.
コマンドもだいたい同じ？

https://incus-ja.readthedocs.io/ja/latest/

LXD は Canonical 傘下。Incus はコミュニティ主導。

- [コンテナをVMみたいに使うならincusが便利だよ。2025/08版](https://zenn.dev/yabuki/articles/2025-08-10-debian-incus)
- [Incus がコンテナとVM管理における Proxmox と Kubernetes のオープンソース代替として登場 — BigGo ファイナンス](https://finance.biggo.jp/news/202507131329_Incus_Open_Source_Container_VM_Management)
- [第55回　コンテナと仮想マシンのマネージャ'Incus' | gihyo.jp](https://gihyo.jp/article/2024/01/linux_containers-0055)

# Version

## 6.0

## @202310

# storage pool

- [第571回　LXD 3.0のストレージ設定 | gihyo.jp](https://gihyo.jp/admin/serial/01/ubuntu-recipe/0571)

## list

```sh
$ incus storage list
+---------+--------+-------------+---------+---------+
|  NAME   | DRIVER | DESCRIPTION | USED BY |  STATE  |
+---------+--------+-------------+---------+---------+
| default | dir    |             | 2       | CREATED |
+---------+--------+-------------+---------+---------+
```

# image

# instance

## list

```sh
$ incus list
```

# image

## openwrt

- [Incus コンテナ内で OpenWRT を動かしルーターにする #container - Qiita](https://qiita.com/assi-dangomushi/items/f797537af5ace9f6a406)

