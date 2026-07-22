- [Go言語のターミナルアプリでテーブルを画面に合わせて表示する方法 #BubbleTea - Qiita](https://qiita.com/twsnmp/items/be68fc6c700c573a8cc3)

```go
var size tea.WindowSizeMsg

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.WindowSizeMsg:
		size = msg
```
