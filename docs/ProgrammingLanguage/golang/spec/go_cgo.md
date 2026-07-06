# cgo

- [Big Sky :: ちっちゃなビルドシステム qo が激しく便利だった件](https://mattn.kaoriya.net/software/lang/c/20141225110405.htm)
- [cgo の基本的な使い方とポインタ周りのTips (Go v1.2) | LESS IS MORE](https://r9y9.github.io/blog/2014/03/22/cgo-tips/)

# zig cc

- https://www.reddit.com/r/golang/comments/1ixdprg/crosscompiling_cgo_with_zig/

```sh
$ CGO_ENABLED=1 GOOS=linux CC="zig cc -target x86_64-linux-musl" go build .
```

# glfw

https://github.com/go-gl/glfw
