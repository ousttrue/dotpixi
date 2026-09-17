# mode

## private

> 同じ親インターフェース上のサブインターフェースは、相互に通信できません

- [macvlan の使い方と挙動のメモ #Linux - Qiita](https://qiita.com/albatross/items/8c32615b5154acf712f2)

## vepa

## bridge

> 相互通信可能

- [1つのNICにmacvlanで複数の仮想NICを作成する！](https://zenn.dev/tochiman/articles/0d1ef4690dd1db)

```sh
ip link add macvlan1 link eth0 type macvlan mode bridge
ip link add macvlan2 link eth0 type macvlan mode bridge
ip netns add net1
ip netns add net2
ip link set macvlan1 netns net1
ip link set macvlan2 netns net2
```

## passthru

> 単一のVM

# parent

- [ZFSを使っているUbuntuのIncus上でmacvlanを使ってFreeBSDの仮想マシンを動かす · hnakamur's blog](https://hnakamur.github.io/blog/2025/02/14/freebsd-vm-incus-macvlan/)
