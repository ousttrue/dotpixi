# 2JCIE-BU01

- https://omronfs.omron.com/ja_JP/ecb/products/pdf/CDSC-016A-web1.pdf
- https://www.components.omron.com/sensors/iot-sensors/enviorment-sensors/2jcie_bu01_usb-driver/download

## node-red

- [解説：センサーデータの収集フロー | enebular blog](https://blog.enebular.com/samples/sensor-data-collection-flow/)
- `Node-RED` [OMRON USB型環境センサー 2JCIE-BUをLinux(debian9/OpenBlocks IoT)からUSB接続して使用する #Linux - Qiita](https://qiita.com/goto2048/items/d2706088af90503dd4c8)

## linux

```
modprobe ftdi_sio
```

```
$ lsusb
`Bus 003 Device 005: ID 0590:00d4 Omron Corp.`
```

- `sample code` [「オムロン 環境センサ(USB)」からUSB通信を用いたデータ収集 | Armadilloサイト](https://armadillo.atmark-techno.com/howto/armadillo_2JCIEBU01_USBcom)

## usb

- [USBデバイスのVendor ID、Product ID等を調べるには https://qiita.com/take5249/items/6aaad432584a5e80bf34]
- https://github.com/Microsoft/Windows-driver-samples/tree/master/usb/usbview
- http://pyusb.github.io/pyusb/
