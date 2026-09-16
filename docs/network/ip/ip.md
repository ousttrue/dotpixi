`iproute2` `/usr/bin/ip`


`ifconfig` の後継。


# ip link add

## macvlan

```sh
$ sudo ip link add veth0 link eth0.1 type macvlan mode bridge

$ sudo ip link add dev macvlan0 link eth0 type macvlan
```

- https://www.reddit.com/r/systemd/comments/k17jcf/how_to_create_macvlan_interfaces_with/?tl=ja

## vlan

## veth

```sh
$ sudo ip link add name veth0-host type veth peer name veth0-ct
```

- [第6回　Linuxカーネルのコンテナ機能［5］ ─ネットワーク | gihyo.jp](https://gihyo.jp/admin/serial/01/linux_containers/0006)

## bridge

- [Linux bridgeを使って仮想ネットワークを作る #Docker - Qiita](https://qiita.com/tsuzuki_takaaki/items/187524251831f144ead1)

