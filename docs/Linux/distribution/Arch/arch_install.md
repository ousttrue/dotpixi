# from ssh

- [SSH からインストール - ArchWiki](https://wiki.archlinux.jp/index.php/SSH_%E3%81%8B%E3%82%89%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)

とりあえず入れとく

```sh
# pacman -S vim dhcpcd openssh
```

## host(boot from rom)

```sh
# passwd
```

### /etc/ssh/sshd_config

```
PermitRootLogin yes
```

```sh
# systemctl restart sshd
```

## client

```sh
$ ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@ip.address.of.target
```
