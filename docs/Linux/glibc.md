- @1999 http://archive.linux.or.jp/JF/JFdocs/libc-intro.html
- @2022 [Rust でバイナリを配布する](https://zenn.dev/coord_e/articles/portable-binary-in-rust)
- [glibc ‐ 通信用語の基礎知識](https://www.wdic.org/w/TECH/glibc)
- [glibc/バージョン - おなかすいたWiki！](https://wiki.onakasuita.org/pukiwiki/?glibc%2F%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3)

# glibc Version

- [Glibc Timeline - glibc wiki](https://sourceware.org/glibc/wiki/Glibc%20Timeline)
- [Linux distributions to kernel and glibc versions map · GitHub](https://gist.github.com/richardlau/6a01d7829cc33ddab35269dacc127680)

| name                       | glibc | note        |
| -------------------------- | ----- | ----------- |
| Arch                       | 2.43  | @2026-04-22 |
| zig-0.16                   | 2.4x  |             |
| zig-0.11                   | 2.34  |             |
| Ubuntu 22.04               | 2.35  |             |
| Ubuntu 20.04               | 2.31  |             |
| Ubuntu 18.04               | 2.27  |             |
| Ubuntu 15.10               | 2.21  |             |
| Ubuntu 13.10               | 2.17  |             |
| Debian 11                  | 2.31  |             |
| Debian 10                  | 2.28  |             |
| CentOS 7.2                 | 2.17  |             |
| CentOS 6.3                 | 2.12  |             |
| amazonlinux:2.0.20200406.0 | 2.36  | @2020-04-06 |

```
# zig-0.11
error: zig does not yet provide glibc version 2.35, the max provided version is 2.34
error: unable to build glibc shared objects: InvalidTargetGLibCVersion
```

- `centos 7` @2020 [glibc のバージョンアップでアプリケーションが動かなくなった件 - Qiita](https://qiita.com/matsumoto_sp/items/fc3d4d698bba4eb7b534)
- `centos 7` @2019 [コンテナでC言語の開発環境を構築する - Qiita](https://qiita.com/Be-cricket/items/0d6da899045a1cbab3ea#dockerfile)
- `rust` @2022 [Increasing the glibc and Linux kernel requirements | Rust Blog](https://blog.rust-lang.org/2022/08/01/Increasing-glibc-kernel-requirements.html)
- `arch` @2013 [Arch Linux - News: Update filesystem-2013.01-1 and glibc-2.17-2 together](https://archlinux.org/news/update-filesystem-201301-1-and-glibc-217-2-together/)

## zig

- [`zig cc`: a Powerful Drop-In Replacement for GCC/Clang - Andrew Kelley](https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html)
- [use RHEL 7 / CentOs 7 as the baseline glibc version rather than oldest Debian under LTS · Issue #10840 · ziglang/zig · GitHub](https://github.com/ziglang/zig/issues/10840)

# GLIBC_2.34 not found

- [libc_csu_initを偲ぶ 〜さよなら俺達の後方互換〜](https://compositecomputer.club/blog/37oVOzDji1pQQExTtmW0ts)

# 別バージョンの build

- [それ行けLinux～Glibc2環境の構築～](http://ryouto.jp/linux/linux_58.html)
