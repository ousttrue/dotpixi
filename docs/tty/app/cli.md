- @2023 [Rust 製の ls 代替コマンド「exa」がいつの間にか EOL になって「eza」になっていた | 浅瀬に徒浪](https://shoalwave.net/develop/2023100406414/)
- @2022 [新マンドライン環境](https://zenn.dev/zenwerk/scraps/8d323eaa63b76d)
- [ファイル検索ツール fd の使い方メモ](https://zenn.dev/megeton/articles/c408511c66f45d)

```sh
> neofetch
         -/oyddmdhs+:.                ousttrue@gent
     -odNMMMMMMMMNNmhy+-`             -------------
   -yNMMMMMMMMMMMNNNmmdhy+-           OS: Gentoo Linux x86_64
 `omMMMMMMMMMMMMNmdmmmmddhhy/`        Kernel: 6.12.54-gentoo-dist
 omMMMMMMMMMMMNhhyyyohmdddhhhdo`      Uptime: 8 hours, 52 mins
.ydMMMMMMMMMMdhs++so/smdddhhhhdm+`    Packages: 1223 (emerge), 15 (flatpak)
 oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.   Shell: bash 5.3.3
  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh   Resolution: 3840x2160
    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy   DE: Plasma 6.4.5
       /mMMMMMMNNNmmmdddhhhhhmMNhs:   WM: kwin
    `oNMMMMMMMNNNmmmddddhhdmMNhs+`    Theme: Adwaita [GTK3]
  `sNMMMMMMMMNNNmmmdddddmNMmhs/.      Icons: Adwaita [GTK3]
 /NMMMMMMMMNNNNmmmdddmNMNdso:`        Terminal: WezTerm
+MMMMMMMNNNNNmmmmdmNMNdso/-           CPU: Intel i7-6700K (8) @ 4.200GHz
yMMNNNNNNNmmmmmNNMmhs+/-`             GPU: NVIDIA GeForce GTX 1060 6GB
/hMMNNNNNNNNMNdhs++/-`                Memory: 10260MiB / 15894MiB
`/ohdmmddhys+++/:.`
  `-//////:--.
```

| basic     | modern        | windows |
| --------- | ------------- | ------- |
| coreutils |               | ok      |
| ls        | lsd, eza, exa | busybox |
| grep      | rg            | ok      |
| find      | fd            | ok      |
|           | fzf           | ok      |
|           | ghq           | ok      |
| top       | btm           | ok      |
| cat       | bat           | ok      |
| du        | dust          | ok      |
