```
KMS = Kernel Mode Setting
DRM = Direct Rendering Manager
DRI = Direct Rendering Infrastructure

+-kernel-+
|   DRM <== libdrm <== app
+--------+
```

`/dev/dri/card<n>`

`/dev/fb<n>`

- @2020 [ttyから自作ゲームエンジンを起動する - Qiita](https://qiita.com/Pctg-x8/items/52c7e018556ec5c867de)
- @2016 [DRM/KMS についてメモ – すらりん日記](https://blog.techlab-xe.net/drmkms-%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6%E3%83%A1%E3%83%A2/)

- https://github.com/embear-engineering/drm-framebuffer

# LibDRM

# API

## GBM（Generic Buffer Manager）

## EGLStreams

https://zenn.dev/hidenori3/articles/c2be2bd50fc8dd

# kms-vulkan

https://github.com/nyorain/kms-vulkan

固まる

# kvd

https://github.com/ShadowCurse/kdv

```zig
const card_path = "/dev/dri/card1";
```

動かず

# vkmark

https://github.com/vkmark/vkmark

動いた。

# glmark2

https://github.com/glmark2/glmark2

```sh
$ meson setup build -Dflavors=drm-gl
```

動いた。

# fui

```c
#include <linux/fb.h>
```

https://github.com/martinfama/fui

固まる
