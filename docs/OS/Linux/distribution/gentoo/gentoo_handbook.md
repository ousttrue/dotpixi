# disks

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks

```sh
DEV="/dev/sda4"
mkfs.ext4 $DEV
e2label $DEV gentoo
mount $DEV /mnt/gentoo
```

# stage

## date

```sh
# MMDDhhmmYYYY
date 100313162021
```

## download stage

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Stage

- https://www.gentoo.org/downloads/

`stage3 systemd`

```sh
curl -LO $URL
tar xf
```

```
# add /mnt/gentoo/etc/inputrc
"\C-n":history-search-forward
"\C-p":history-search-backward
```

```sh
vim /mnt/gentoo/etc/portage/make.conf
```

# base

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Base

## mount

## chroot

## mount efi

```sh
mkdir -p /efi
mount /dev/sda1 /efi
```

## emerge sync

```sh
emerge-websync
eselect news read
```

## vim

```sh
emerge -av vim
eselect editor list
eselect editor set ?
```

## timezone

```sh
ln -sf ../usr/share/zoneinfo/Asia/Tokyo /etc/localtime
```

## locale-gen

# kernel

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Kernel

## firmware

## installkernel

### systemd-boot on systemd

```/etc/portage/package.use/systemd
sys-apps/systemd boot
sys-kernel/installkernel systemd-boot
```

### Initramfs

`dracut`

## gentoo-kernel-bin

ビルド済みを使う。`kernel build` が発動しないように注意

- 署名, secureboot 不要

```sh
emerge --ask sys-kernel/gentoo-kernel-bin
```

## gentoo-sources

# system

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/System

## genfstab

```sh
genfstab / >> /etc/fstab
```

## dhcpcd

```sh
systemctl enable dhcpcd
```

## systemd

# tools

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Tools

# bootloader

https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Bootloader

## systemd-boot

```sh
bootctl install
bootctl list
         type: Boot Loader Specification Type #1 (.conf)
        title: Gentoo Linux (default) (not reported/new)
           id: gentoo-6.12.54-gentoo-dist.conf
       source: /efi//loader/entries/gentoo-6.12.54-gentoo-dist.conf (on the EFI System Partition)
     sort-key: gentoo
      version: 6.12.54-gentoo-dist
        linux: /efi//gentoo/6.12.54-gentoo-dist/linux
       initrd: /efi//gentoo/6.12.54-gentoo-dist/microcode-amd
               /efi//gentoo/6.12.54-gentoo-dist/initrd
      options: root=UUID=8677a3b0-6c5e-4b0b-b14a-8385a0e5530d rw loglevel=3 quiet
```

### error !

```
failed to auto mount 的な
```

`/efi/loader/entries/gentoo-6.12.54-gentoo-dist.conf`

```
title Gentoo
linux efi/GENTOO/kernel-6.12.47-gentoo-dist.efi
initrd efi/GENTOO/initramfs-6.12.47-gentoo-dist.img
options root=/dev/nvme0n1p2 # 👈確認するべし。UUID 間違っているなど。quiet もよくない
```
