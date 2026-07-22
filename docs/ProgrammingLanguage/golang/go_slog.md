- @2025 [Go言語の構造化ログ標準ライブラリであるlog/slogについて](https://zenn.dev/baleenstudio/articles/f408e5fbfc1fda)

`Go 1.21`

```go
package main

import "log/slog"

func main() {
	// slogは標準のlogと違いログの出力レベルを指定できるのがメリットの一つ
	// Infoレベルで単純なログを標準エラー出力に出力する
	slog.Info("Hello, world!")

    slog.Debug("debug")
    slog.Info("info")
    slog.Warn("warn")
    slog.Error("error")
}
```

- @2026 [Go の使い方｜slog 構造化ログ完全ガイド｜出力先・レベル・属性を1枚で設計する｜エンジニア翔｜Claude Code](https://note.com/engineer_sho_ai/n/nc5fd12887109)

```go
logger := slog.New(slog.NewJSONHandler(os.Stdout, nil))
slog.SetDefault(logger)      // 以後 slog.Info(...) が JSON で出る
```

# Handler

- [slog-handler-guide - 作ったものとか](https://shuheikubota.github.io/note/20240504-go-slog/)

```go
type Handler interface {
    Enabled(context.Context, Level) bool
    Handle(context.Context, Record) error
    WithAttrs(attrs []Attr) Handler
    WithGroup(name string) Handler
}
```

- [Go公式の構造化ロガー（予定）のslogの出力を見やすくしてみる](https://zenn.dev/mizutani/articles/golang-clog-handler)

```go
handler := clog.New(clog.WithColor(true))
logger := slog.New(handler)
slog.SetDefault(logger)
```

- [Go言語のslogで何も出力しないloggerを作る（discard） - nwtgck / Ryo Ota](https://scrapbox.io/nwtgck/Go%E8%A8%80%E8%AA%9E%E3%81%AEslog%E3%81%A7%E4%BD%95%E3%82%82%E5%87%BA%E5%8A%9B%E3%81%97%E3%81%AA%E3%81%84logger%E3%82%92%E4%BD%9C%E3%82%8B%EF%BC%88discard%EF%BC%89)

```go
type nopHandler struct{}

func (h *nopHandler) Enabled(ctx context.Context, level slog.Level) bool {
	return false
}

func (h *nopHandler) Handle(ctx context.Context, record slog.Record) error {
	return nil
}

func (h *nopHandler) WithAttrs(attrs []slog.Attr) slog.Handler {
	return h
}

func (h *nopHandler) WithGroup(name string) slog.Handler {
	return h
}
```

- @2024 [Goのslogでインデント付きのJSONを出力するハンドラを実装する](https://zenn.dev/minguu42/articles/20240706-slog-json-indent-handler)
