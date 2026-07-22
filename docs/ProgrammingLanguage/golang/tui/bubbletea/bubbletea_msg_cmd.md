# tea.Cmd

- [Commands in Bubble Tea](https://charm.land/blog/commands-in-bubbletea/)
- https://github.com/charmbracelet/bubbletea/tree/main/tutorials/commands

goroutine により backgroud で実行する。結果の tea.Msg は、
tea.XXX 以外は、Update に配送される。

```go
// Cmd is an IO operation that returns a message when it's complete. If it's
// nil it's considered a no-op. Use it for things like HTTP requests, timers,
// saving and loading from disk, and so on.
//
// Note that there's almost never a reason to use a command to send a message
// to another part of your program. That can almost always be done in the
// update function.
type Cmd func() Msg
```

- [Golangで作るTUIツール | WeCapital技術ブログ](https://wecapital-inc.github.io/golan-ping-tool/)

# tea.Msg

Update で dispatch する。
