`/var/lib/forgejo/data/forgejo-repositories`

`/var/lib/forgejo/data/lfs`

https://wiki.archlinux.org/title/Forgejo#Setup_for_custom_data_directory

```title=/etc/systemd/system/forgejo.service.d/data-directory.conf
[Service]
ReadWriteDirectories=/srv/forgejo
```

https://wiki.archlinux.org/title/Forgejo#Configure_SSH

forgejo user home => /var/lib/forgejo
