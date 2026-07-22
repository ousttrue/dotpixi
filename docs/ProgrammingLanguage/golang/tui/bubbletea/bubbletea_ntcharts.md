https://github.com/NimbleMarkets/ntcharts

- https://github.com/lrstanley/bubblezone

# examples/sparkline

`A small, simple visual of data chart for quick understanding.`

# tutorial

https://github.com/NimbleMarkets/ntcharts/blob/v2/examples/quickstart/README.md

```go
package main

import (
	"fmt"
	"os"
	"time"

	"github.com/NimbleMarkets/ntcharts/v2/sparkline"
	"github.com/shirou/gopsutil/cpu"

	tea "charm.land/bubbletea/v2"
	"charm.land/lipgloss/v2"
)

var defaultStyle = lipgloss.NewStyle().
	BorderStyle(lipgloss.NormalBorder()).
	BorderForeground(lipgloss.Color("63")) // purple

var blockStyle4 = lipgloss.NewStyle().
	Foreground(lipgloss.Color("3")) // yellow

type model struct {
	s5  sparkline.Model
	max float64
}

type valueMsg float64

func (m model) Init() tea.Cmd {
	return m.tick()
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.KeyMsg:
		switch msg.String() {
		case "q", "ctrl+c":
			return m, tea.Quit
		}

	case valueMsg:
		m.s5.Push(float64(msg))
		m.s5.DrawBraille()
		return m, m.tick()
	}

	return m, nil
}

func (m model) View() tea.View {
	s := defaultStyle.Render(m.s5.View())
	return tea.NewView(s)
}

func main() {
	width := 25
	height := 12
	max := 100.0

	m := model{
		sparkline.New(width, height, sparkline.WithMaxValue(max), sparkline.WithStyle(blockStyle4)),
		max}
	if _, err := tea.NewProgram(m).Run(); err != nil {
		fmt.Println("Error running program:", err)
		os.Exit(1)
	}
}

func (m model) tick() tea.Cmd {
	return tea.Tick(time.Millisecond*500, func(t time.Time) tea.Msg {
		return valueMsg(rand.Float64() * m.max)
	})
}
```

## 合体

- https://github.com/iv4n-ga6l/Go-Computer-system-resources-monitoring

```go
import (
	"github.com/shirou/gopsutil/cpu"
)

func (m model) tick() tea.Cmd {
	return tea.Tick(time.Millisecond*500, func(t time.Time) tea.Msg {
		cpuPercent, err := cpu.Percent(0, false)
		if err != nil {
			panic(err)
		}
		return valueMsg(cpuPercent[0])
	})
}
```
