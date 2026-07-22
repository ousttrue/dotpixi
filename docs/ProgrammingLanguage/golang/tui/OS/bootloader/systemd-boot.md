
# entry を確認する

`/boot` に `EFI partision` をmount していて、
`EFI partision` の `efi/GENTOO/kernel-6.12.47-gentoo-dist.efi` を指定している。
`EFI partision` の `loader/entries/gentoo.conf` に systemd-boot の entry を記述している。

```sh
# bootctl list
         type: Boot Loader Specification Type #1 (.conf)
        title: Gentoo (default) (selected)
           id: gentoo.conf
       source: /boot//loader/entries/gentoo.conf (on the EFI System Partition)
        linux: /boot//efi/GENTOO/kernel-6.12.47-gentoo-dist.efi
       initrd: /boot//efi/GENTOO/initramfs-6.12.47-gentoo-dist.img
      options: root=/dev/nvme0n1p2
```

でうまくいくか確認するべし

`/boot/loader/entries/gentoo.conf`

```
title Gentoo
linux efi/GENTOO/kernel-6.12.47-gentoo-dist.efi
initrd efi/GENTOO/initramfs-6.12.47-gentoo-dist.img
options root=/dev/nvme0n1p2
```
