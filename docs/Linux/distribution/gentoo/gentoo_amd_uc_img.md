not found amd-uc.img で kernel panic

- https://www.reddit.com/r/Gentoo/comments/1dheldc/stuck_at_loading_initial_ramdisk/?tl=ja

- gentoo-kernel-bin と grub.cfg の不整合で起きることがあるぽい。

```sh
gmerge --config entoo-kernel-bin
grub-config やりなおし
```

でなおった(amd-uc.img が起動引数から消えた)。
vulkan を有効にする過程で grub.cfg が変わったぽい？

