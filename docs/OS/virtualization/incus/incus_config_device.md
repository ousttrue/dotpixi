https://linuxcontainers.org/incus/docs/main/reference/manpages/incus/config/device/

## lxc config device add <instance> <new device name> <type>

```sh
lxc config device add wrt-01 wifi nic nictype=physical parent=wlan1 name=wlan0

lxc config device add wrt-01 myvlan nic nictype=macvlan parent=eth0
```

