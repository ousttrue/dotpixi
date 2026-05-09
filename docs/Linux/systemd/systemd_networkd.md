- [Linuxルーターを systemd-networkd に移行してみる](https://blog.ingen084.net/posts/2024-02-04-migrate-to-systemd-networkd)

`/etc/systemd/network/`

## 固定IP

- [systemd-networkdで場所によって固定IPアドレス、動的と振り分ける](https://zenn.dev/oto/articles/2ae88496967d61)
- [systemd-networkd - ArchWiki](https://wiki.archlinux.jp/index.php/Systemd-networkd#.E6.9C.89.E7.B7.9A.E3.82.A2.E3.83.80.E3.83.97.E3.82.BF.E3.81.A7.E5.9B.BA.E5.AE.9A_IP_.E3.82.92.E4.BD.BF.E7.94.A8)

`/etc/systemd/network/lan0.network`

```
[Match]
Name=enp0s*

[Network]
Address=10.1.10.9/24
Gateway=10.1.10.1
DNS=10.1.10.1
```

```sh
systemctl disable systemd-dhcpcd
systemctl restart systemd-networkd
```

## dhcpcd

```sh
$ pacman -S dhcpcd
$ systemctl enable --now dhcpcd@enp3s0.service
```

## dns

- [go get - proxy.golang.org connection refused - Stack Overflow](https://stackoverflow.com/questions/77219745/go-get-proxy-golang-org-connection-refused)

```sh
// Source - https://stackoverflow.com/a
// Posted by Rodrigo Carranza
// Retrieved 2025-11-30, License - CC BY-SA 4.0

# ln -sf ../run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
```

`resolvectl status`

- https://wiki.archlinux.jp/index.php/Systemd-resolved#DNS_.E3.82.B5.E3.83.BC.E3.83.90.E3.83.BC.E3.81.AE.E8.A8.AD.E5.AE.9A

## avahi

- https://www.reddit.com/r/debian/comments/1bsej7f/systemdresolved_and_mdns_responder_issue/
