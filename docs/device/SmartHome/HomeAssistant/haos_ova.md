> Home Assistant OS has a specific image for use on virtualized systems called ova

- https://manuelcortez.net/2025/10/homeassistant-incus/

- https://github.com/home-assistant/operating-system/releases

から最新版をゲットするべし。

```sh
mkdir homeassistant
cd homeassistant
wget https://github.com/home-assistant/operating-system/releases/download/16.2/haos_ova-16.2.qcow2.xz
```

```
incus config device add homeassistant zigbee-usb usb vendorid=1a86 productid=55d4
```
