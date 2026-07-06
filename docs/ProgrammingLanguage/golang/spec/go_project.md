- @2023 [Goのリポジトリ名とディレクトリ名とファイル名とパッケージ名の関係](https://bayashi.net/diary/2023/0411)
- [goでディレクトリ名とpackage名が一致しないとき，importする側はどうなる？](https://zenn.dev/miyataka/scraps/849be35072822a)
- [少しずつ育てるGo言語のプロジェクト構成](https://zenn.dev/foxtail88/articles/824c5e8e0c6d82)
- [Organizing a Go module - The Go Programming Language](https://go.dev/doc/modules/layout)

# directory & package

[Go のパッケージ - 公開技術情報](https://ifritjp.github.io/documents/go/package/)

- パッケージ == ディレクトリ
- パッケージは名前を持つ
- パッケージの外部に公開するシンボルは、先頭を大文字にする

> 各ディレクトリは個別のパッケージとして扱われ => subディレクトリ内では ディレクトリ名と同じpackage 名を使う

> ディレクトリ名とpackage名が異なるのは，mainパッケージのケースだけにすべき．なぜなら，build後のバイナリを利用するので，goのライブラリとして利用することはない

# mod

```sh
$ MODNAME=go-counter

$ mkdir ${MODNAME}
$ cd ${MODNAME}
$ go mod init github.com/${USERNAME}/{$MODNAME}
```

## package main

```go
package main

func main() {
  // ...
}
```
