# keyword

```
--autounmask=y --autounmask-write
```

# install 後

## euse

- app-portage/gentoolkit
- https://wiki.gentoo.org/wiki/Euse

## git化

- [GentooのPortageのアップデートをrsyncからgitにした](https://zenn.dev/minervajuppiter/articles/a1d15e757ef0f8)
- eselect repository
- https://wiki.gentoo.org/wiki/Eselect/Repository

`/var/db/repos/gentoo` に clone される。

## eix

```sh
euse -E sqlite -p eix
```

## cron daily

`/etc/cron.daily/sync.sh`

```sh
#!/bin/sh
eix-sync
```

# unmet requirements.

https://wiki.gentoo.org/wiki/Required_USE_flags

# use flags

# overlay

https://wiki.gentoo.org/wiki/Project:Overlays/Overlays_guide

### mirror

https://wiki.gentoo.org/wiki/Portage_with_Git

- [::gentoo のGit mirrorを使う :: 切腹倶楽部](https://seppuku.club/unix-like/gentoo-git-mirror/)

## guru

https://wiki.gentoo.org/wiki/Project:GURU

- https://github.com/gentoo/guru

```sh
eselect repository enable guru
emaint sync -r guru
```
