- [Linux kernel release 5.x (2/4) #Linux - Qiita](https://qiita.com/hon_no_mushi/items/3388811de24f08f454f6)

# oldconfig, olddefconfig

- [make oldconfigについて](https://zenn.dev/mhhkn098/scraps/7388b1bfbc6d2b)

# module を削る

- [新Linuxカーネル解読室落穂拾い (1) - VA Linux エンジニアブログ ](https://www.valinux.co.jp/blog/entry/20250724#config%E3%81%AE%E4%BD%9C%E6%88%90)
- @2020 [linux kernelのmakeターゲットについてのあれこれ - 覚書](https://satoru-takeuchi.hatenablog.com/entry/2020/03/26/005735)
- @2018 [カーネルのビルド時間を短縮する技 | ガジェット好きの日記](https://mongonta.com/f277-howto-shorten-linux-kernel-build-time/)

```
zcat /proc/config.gz > .config
make olddefconfig
make localmodconfig
make menuconfig
    CONFIG_LOCALVERSION="test-01"

make -j4
make modules_install
make install
```

## auto update

```sh
$ systemctl --user enable modprobed-db
```

# allnoconfig

- [make allnoconfigのすゝめ · GitHub](https://gist.github.com/sasairc/978321cdcc08672cfcf55a11b6c15ca7)
- [kernel config 生成(略記)のためのシェルスクリプト - 何とは言わない天然水飲みたさ](https://blog.cardina1.red/2016/12/06/kernel-config-shellscript/)
- [linuxカーネルの軽量化を目指す - コンピュータ技術者になるための備忘録](https://silenvx.hatenadiary.org/entry/20120728/1343438032)

## qemu

- [QEMU / gdb で Linux kernel の動きを確認する #Linux - Qiita](https://qiita.com/tobira-code/items/4ac30b34453da7afbbd5)

# tinyconfig

## qemu

- @2020 [Linux tinyconfig and Qemu | RK’s Notes](https://z49x2vmq.github.io/2020/12/24/linux-tiny-qemu/)
