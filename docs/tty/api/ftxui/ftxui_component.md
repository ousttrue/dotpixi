Component のツリーはイベントを伝搬する。
`Renderer` の第１引数に `子Component` を指定できる。

`ScreenInteractive`

# hello

[[ftxui_screen]]

## Renderer

### 描画のみ。OnEvent が無い例

```cpp
#include <ftxui/component/component.hpp>
#include <ftxui/component/screen_interactive.hpp>

int main() {

  auto interactive = ftxui::ScreenInteractive::Fullscreen();

  auto component = ftxui::Renderer([]() { return ftxui::text("[q] to quit"); });

  auto event_component = CatchEvent(component, [&](ftxui::Event event) {
    if (event == ftxui::Event::Character('q') ||
        event == ftxui::Event::Escape) {
      interactive.ExitLoopClosure()();
      return true;
    }

    return false;
  });

  interactive.Loop(event_component);

  return 0;
}
```

### Component を構成する

https://github.com/ArthurSonzogni/FTXUI/blob/main/examples/component/renderer.cpp

```cpp
#include "ftxui/component/captured_mouse.hpp" // for ftxui
#include "ftxui/component/component.hpp"      // for Renderer, Button, Vertical
#include "ftxui/component/component_base.hpp" // for ComponentBase
#include "ftxui/component/screen_interactive.hpp" // for ScreenInteractive
#include "ftxui/dom/elements.hpp" // for operator|, Element, text, bold, border, center, color
#include "ftxui/screen/color.hpp" // for Color, Color::Red

auto makeComponents(const std::function<void()> &onClick) {
  // 1. Example of focusable renderer:
  auto renderer_focusable = ftxui::Renderer([](bool focused) {
    using namespace ftxui;
    if (focused)
      return text("FOCUSABLE RENDERER()") | center | bold | border;
    else
      return text(" Focusable renderer() ") | center | border;
  });

  // 2. Examples of a non focusable renderer.
  auto renderer_non_focusable = ftxui::Renderer([&] {
    using namespace ftxui;
    return text("~~~~~ Non Focusable renderer() ~~~~~"); //
  });

  // 3. Renderer can wrap other components to redefine their Render() function.
  auto button = ftxui::Button("Wrapped quit button", onClick);

  // A Renderer() is a component using a lambda function as a parameter to
  // render itself.
  auto renderer_wrap = Renderer(button, [&] {
    using namespace ftxui;
    if (button->Focused())
      return button->Render() | bold | color(Color::Red);
    else
      return button->Render();
  });

  return ftxui::Container::Vertical({
      renderer_focusable,
      renderer_non_focusable,
      renderer_wrap,
  });
}

int main() {
  auto screen = ftxui::ScreenInteractive::FitComponent();
  auto component = makeComponents(screen.ExitLoopClosure());
  screen.Loop(component);
}
```

# widgets

## Button

## Checkbox/Radiobox

## Slider

## Input

## ftxui::ComponentBase

[FTXUI: include/ftxui/component/component_base.hpp Source File](https://arthursonzogni.github.io/FTXUI/component__base_8hpp_source.html)
OnEvent でイベントハンドリングできる

```cpp
	    ftxui::Element Render() override;
    bool OnEvent(ftxui::Event) override;
```

# Splitter

```cpp
#include "ftxui/component/component.hpp"
#include "ftxui/component/screen_interactive.hpp" // for ScreenInteractive

class Splitter : public ftxui::ComponentBase {

  int m_left_size = 20;

  ftxui::Component m_center =
      ftxui::Renderer([] { return ftxui::text("center") | ftxui::center; });
  ftxui::Component m_left =
      ftxui::Renderer([] { return ftxui::text("left") | ftxui::center; });
  ftxui::Component container =
      ResizableSplitLeft(m_left, m_center, &m_left_size);

public:
  std::function<void()> OnQuit;

  ftxui::Element Render() override { return container->Render(); }
  bool OnEvent(ftxui::Event event) override {
    if (event == ftxui::Event::Character('q')) {
      if (OnQuit) {
        OnQuit();
      }
    }

    if (event == ftxui::Event::ArrowLeft ||
        event == ftxui::Event::Character('h')) {
      m_left_size = std::max(2, m_left_size - 1);
      return true;
    }

    if (event == ftxui::Event::ArrowRight ||
        event == ftxui::Event::Character('l')) {
      m_left_size = std::min(ftxui::Terminal::Size().dimx - 3, m_left_size + 1);
      return true;
    }

    return false;
  }
};

int main() {
  auto component = ftxui::Make<Splitter>();
  auto screen = ftxui::ScreenInteractive::Fullscreen();
  component->OnQuit = screen.ExitLoopClosure();
  screen.Loop(component);
}
```

# ContainerBase: ComponentBase

navigation(select 制御)がある

## Container

```c++
  auto composition = Container::Horizontal({leftpane, rightpane});
```

## container item

```c++
ftxui::Component Custom(const std::string &label) {
  return ftxui::Renderer([label](bool focused) {
    auto e = ftxui::text(label);
    if (focused) {
      e = e | ftxui::inverted;
    }
    return e;
  });
}
```

## Menu(Selector)

- entry は `std::string` `std::span<T>` + transform にしたい

## collabsible

[FTXUI: examples/component/collapsible.cpp](https://arthursonzogni.github.io/FTXUI/examples_2component_2collapsible_8cpp-example.html)

# ScreenInteractive

loop で component を Rendering する。

## ScreenInteractive::Loop

```cpp
void ScreenInteractive::Loop(Component component) {  // NOLINT
  class Loop loop(this, std::move(component));
  loop.Run();
}
```

## ScreenInteractive::Fullscreen

- https://arthursonzogni.github.io/FTXUI/examples_2component_2resizable_split_8cpp-example.html

## ScreenInteractive::FitComponent

- button
- composition

## ScreenInteractive::TerminalOutput

- maybe
