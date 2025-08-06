# Screen::ToStoring

```cpp
#include <ftxui/screen/screen.hpp>
#include <iostream>

int main(void) {
  auto screen = ftxui::Screen::Create(ftxui::Dimension::Fixed(32),
                                      ftxui::Dimension::Fixed(10));

  auto &pixel = screen.PixelAt(3, 3);
  pixel.character = U'A';
  pixel.bold = true;
  pixel.foreground_color = ftxui::Color::Blue;

  std::cout << screen.ToString();
  return EXIT_SUCCESS;
}
```
