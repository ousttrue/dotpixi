# basic

https://arthursonzogni.github.io/FTXUI/module-dom.html

> a hierarchical set of ftxui::Element

https://arthursonzogni.github.io/FTXUI/#example

```cpp
int main() {
  using namespace ftxui;

  // Create a simple document with three text elements.
  Element document = hbox({
      text("left") | border,
      text("middle") | border | flex,
      text("right") | border,
  });

  // Create a screen with full width and height fitting the document.
  auto screen = Screen::Create(Dimension::Full(),       // Width
                               Dimension::Fit(document) // Height
  );

  // Render the document onto the screen.
  Render(screen, document);

  // Print the screen to the console.
  screen.Print();
}
```

print して終わり。
loop によるイベントハンドリングは、componentで

## document & print

```cpp
#include <ftxui/dom/elements.hpp>

void Print(ftxui::Element document) {
  auto screen = ftxui::Screen::Create(
      // Width
      ftxui::Dimension::Full(),
      // Height
      ftxui::Dimension::Fit(document));

  ftxui::Render(screen, document);
  screen.Print();
}

int main() {
  auto document = ftxui::hbox({
      ftxui::text("left") | ftxui::border,
      ftxui::text("middle") | ftxui::border | ftxui::flex,
      ftxui::text("right") | ftxui::border,
  });

  Print(document);
}
```

# ftxui::Node

## Text

```cpp
#include <ftxui/dom/elements.hpp>

class Text : public ftxui::Node {
public:
  explicit Text(std::string text) : text_(std::move(text)) {}

  void ComputeRequirement() override {
    requirement_.min_x = ftxui::string_width(text_);
    requirement_.min_y = 1;
  }

  void Render(ftxui::Screen &screen) override {
    int x = box_.x_min;
    const int y = box_.y_min;
    if (y > box_.y_max) {
      return;
    }
    for (const auto &cell : ftxui::Utf8ToGlyphs(text_)) {
      if (x > box_.x_max) {
        return;
      }
      if (cell == "\n") {
        continue;
      }
      screen.PixelAt(x, y).character = cell;
      ++x;
    }
  }

private:
  std::string text_;
};

// use
auto element = std::make_shared<Text>("abc");
```

# ftxui::Render

`Element => Screen`
`Node::Render(Screen)`

# ftxui::Element

```cpp
using Element = std::shared_ptr<Node>;
using Elements = std::vector<Element>;
```

## hbox / vbox

```cpp
// Define the document
document = vbox({
  text("The window") | bold | color(Color::Blue),
  gauge(0.5)
  text("The footer")
});
```

## border

```cpp
// Add a border, by calling the `ftxui::border` decorator function.
document = border(document);

// Add another border, using the pipe operator.
document = document | border.

// Add another border, using the |= operator.
document |= border
```
