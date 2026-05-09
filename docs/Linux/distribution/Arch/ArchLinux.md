## init

```sh
$ lsblk -o name,label
$ mkfs.ext4 /dev/xxx
$ mount /dev/xxx /mnt

$ pacstrap /mnt base linux linux-firmware
$ genfstab -U /mnt >> /mnt/etc/fstab
```

## `/etc/inputrc`

```sh
"\C-n":history-search-forward
"\C-p":history-search-backward
```

## openssh

```sh
$ pacman -S openssh
# $ systemctl start sshd.service
$ systemctl enable --now sshd.service
```

## nvidia

GTX-1060 が AUR に。

`nvidia-580xx-dkms` を使う。
事前に dkms(Dynamic Kernel Module Support) のビルド環境を入れておくべし。

```sh
> sudo pacman -S dkms linux-headers

> fd nvidia.ko /lib/modules
/lib/modules/6.18.5-arch1-1/updates/dkms/nvidia.ko.zst
```

## bootloader

```sh
$ pacman -S grub efibootmgr
$ mount /dev/ESP /efi # ESP を /efi に mount する
$ grub-install --efi-directory=/efi

# efi の mount point と無関係
$ grub-mkconfig -o /boot/grub/grub.cfg
```

```
grub> set root=(hd0,gpt3) # UEFI partision
grub> linux /boot/vmlinuz root=/dev/sda3 # kernel
grub> initrd /boot/initrd.img # initrd
grub> boot
```

