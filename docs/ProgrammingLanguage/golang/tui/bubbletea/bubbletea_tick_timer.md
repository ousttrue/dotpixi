# tick

```go
package main

import (
	"fmt"
	"log"
	"time"

	tea "charm.land/bubbletea/v2"
)

func main() {
	p := tea.NewProgram(newModel())
	if _, err := p.Run(); err != nil {
		log.Fatal(err)
	}
}

//
// model
//
func tick() tea.Msg {
	time.Sleep(time.Second)
	return time.Now()
}

type model struct {
	count int
	time  time.Time
}

func newModel() model {
	return model{
		count: 5,
		time:  time.Now(),
	}
}

func (m model) Init() tea.Cmd {
	return tick
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.KeyPressMsg:
		switch msg.String() {
		case "ctrl+c", "q":
			return m, tea.Quit
		case "ctrl+z":
			return m, tea.Suspend
		}

	case time.Time:
		m.time = msg
		m.count--
		if m.count <= 0 {
			return m, tea.Quit
		}
		return m, tick
	}
	return m, nil
}

func (m model) View() tea.View {
	return tea.NewView(fmt.Sprintf("Hi. This program will exit in %d seconds.\n\nTo quit sooner press ctrl-c, or press ctrl-z to suspend...\n%v", m.count, m.time))
}
```

# animation

- examples/space
- examples/doom-fire
