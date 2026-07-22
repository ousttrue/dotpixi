- [Linuxルーターを systemd-networkd に移行してみる](https://blog.ingen084.net/posts/2024-02-04-migrate-to-systemd-networkd)

# /etc/systemd/network

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
