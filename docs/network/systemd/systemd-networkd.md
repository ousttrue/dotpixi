- [Linuxルーターを systemd-networkd に移行してみる](https://blog.ingen084.net/posts/2024-02-04-migrate-to-systemd-networkd)

```sh
> networkctl
IDX LINK    TYPE     OPERATIONAL SETUP
  1 lo      loopback carrier     unmanaged
  2 enp1s0  ether    no-carrier  configuring
  4 wlan0   wlan     routable    configured
  5 docker0 bridge   no-carrier  unmanaged
```

# iwd

- [systemd-networkd で有線と無線をいい感じにする](https://zenn.dev/ysms/articles/37a4d5a687ad5a)
- [完全備忘録iwctl](https://zenn.dev/gobuster/articles/setup-wifi-with-iwctl)

# 構成

`/etc/systemd/network/*.network`

```sh
$ man systemd.network
```

## dhcp client

```ini
[Match]
Name=enp1s0

[Network]
DHCP=yes
```

## fixed

```ini
[Match]
Name=enp1s0

[Network]
Address=10.1.10.9/24
Gateway=10.1.10.1
DNS=10.1.10.1
```

## router

固定IP + DHCPServer の例

```ini
[Match]
Name=enp1s0

[Network]
DHCP=no
Address=10.1.1.1/24
DHCPServer=true
#DHCPv6PrefixDelegation=yes
IPMasquerade=ipv4
#IPv6SendRA=yes

[DHCPServer]
PoolOffset=100
PoolSize=20
EmitDNS=yes
#DNS=9.9.9.9
DNS=8.8.8.8
#EmitRouter=yes
```
