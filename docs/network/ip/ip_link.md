- [ip link add コマンドで利用できる type オプションの種類｜toshi](https://note.com/minato_kame/n/n4f659d202481)
- [[翻訳] 仮想ネットワークのための Linux network interface まとめ](https://markunet.github.io/blog/Intro_Linux_interfaces_JP/)

## veth (Virtual Ethernet)

```sh
ip link add name veth0-host type veth peer name veth0-ct
```

- [第6回　Linuxカーネルのコンテナ機能［5］ ─ネットワーク | gihyo.jp](https://gihyo.jp/admin/serial/01/linux_containers/0006)

## bridge

```sh
ip link add br0 type bridge
ip link set eth0 master br0
ip link set tap1 master br0
ip link set tap2 master br0
ip link set veth1 master br0
```

- [Linux bridgeを使って仮想ネットワークを作る #Docker - Qiita](https://qiita.com/tsuzuki_takaaki/items/187524251831f144ead1)

## macvlan (new macaddress)

```sh
ip link add veth0 link eth0.1 type macvlan mode bridge
```

- https://www.reddit.com/r/systemd/comments/k17jcf/how_to_create_macvlan_interfaces_with/?tl=ja

## ipvlan (same macaddress)

## vlan

```sh
ip link add link eth0 name eth0.2 type vlan id 2
ip link add link eth0 name eth0.3 type vlan id 3
```
