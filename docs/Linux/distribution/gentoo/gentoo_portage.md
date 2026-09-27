- https://wiki.gentoo.org/wiki/Gentoo_Cheat_Sheet/ja

# install 後

## gentoolkit

- app-portage/gentoolkit

### euse

- https://wiki.gentoo.org/wiki/Euse

```sh
euse -E sqlite -p eix
```

## eix

### cron daily[obsolete] => systemd

`/etc/cron.daily/sync.sh`

```sh
#!/bin/sh
eix-sync
```

## git化

https://wiki.gentoo.org/wiki/Portage_with_Git

`/var/db/repos/gentoo` に clone される。
`/var/db/repos/gentoo` を空にしておかないと途中でエラーになるので注意。
上記手順に書いてある(後に書いてある)

## guru

- eselect repository
- https://wiki.gentoo.org/wiki/Eselect/Repository
- https://wiki.gentoo.org/wiki/Project:GURU

- https://github.com/gentoo/guru

```sh
eselect repository enable guru
emaint sync -r guru
```

# unmask

## keyword

```
--autounmask=y --autounmask-write
```

# TUI

- https://github.com/dsafxP/carnage
