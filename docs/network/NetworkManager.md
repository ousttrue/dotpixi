- [NetworkManagerは嫌いです。nmcliでIPアドレス・bondingを設定する。 #centos7 - Qiita](https://qiita.com/takahashi-kazuki/items/a6a607fe6805442c7d5a)

# nmcli

- [NetworkManagerの使用方法 #Network - Qiita](https://qiita.com/fururun02/items/73b751a870adaf94bbf1)

# 止める

```sh
$ sudo systemctl disable NetworkManager
```

## replace NetworkManager by systemd

- [NetworkManagerを無効にしnetworkd を使う。 - それマグで！](https://takuya-1st.hatenablog.jp/entry/2022/09/13/160954)

`/etc/systemd/network/hoge.network`

```ini
[Match]
Name=enp1s0

[Network]
DHCP=yes
```

```sh
$ sudo systemctrl enable systemd-networkd
```

