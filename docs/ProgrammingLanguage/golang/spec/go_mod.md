# GOMODULE

- [GOPATHを掃除してGo Modulesに移行しよう - KAYAC engineers' blog](https://techblog.kayac.com/migration-gopath-to-go-modules)

## project構成

- @2020 [あなたのGoアプリ/ライブラリのパッケージ構成もっとシンプルでよくない？ | フューチャー技術ブログ](https://future-architect.github.io/articles/20200528/)

## go mod init

- [Tutorial: Get started with Go - The Go Programming Language](https://go.dev/doc/tutorial/getting-started)
- @2023 [ちゃんと理解するGo言語開発環境構築：go mod initとその必要性 - Qiita](https://qiita.com/TakanoriVega/items/6d7210147c289b45298a)
- @2021 [go mod完全に理解した](https://zenn.dev/optimisuke/articles/105feac3f8e726830f8c)

```
$ go mod init hello
# go mod init github.com/ユーザー名/GoProject
go.mod
```

```go.mod
module hello

go 1.19
```

[[golang]]

`from 1.11`
`from 1.13 complete`
`from 1.16 default`

@2022 [[Go言語] ファイル分割とローカルパッケージ](https://zenn.dev/fm_radio/articles/ca2ff1dfcf89b5)

module => `go.mod` ファイル
package => `*.go` の `package HOGE` 宣言(directory名と同じにする)

# mod
## init
```
go mod init MODULE_NAME
```

## go.mod
- [go.modとgo.sumの読み方](https://zenn.dev/ryo_yamaoka/articles/595cf9e69229f9)

## go.sum
`go.mod` + `go mod tidy` => `go.sum`

# module の中にパッケージが含まれる
## package はフォルダー

- @2022 [goでディレクトリ名とpackage名が一致しないとき，importする側はどうなる？](https://zenn.dev/miyataka/scraps/849be35072822a)

## file分割
同一フォルダ内で同じ `package hoge`

## package分割


# multi
- @2020 [GoのMulti-module repositoryとバージョン管理 #Git - Qiita](https://qiita.com/takashabe/items/5ef6193a3f92411bf2c5)
