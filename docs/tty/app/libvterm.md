- [GitHub - neovim/libvterm: https://github.com/neovim/neovim/wiki/Deps#forks](https://github.com/neovim/libvterm)
- @2018 [golang で libvterm - Qiita](https://qiita.com/mattn/items/5aed718a65d21ca7855c)

# Version

# neovim-0.11 adopted

https://github.com/neovim/neovim/tree/master/src/nvim/vterm

- `unicode.c` の機能が utf8proc ライブラリで置き換えられるなど独立したライブラリではなくなっている

# neovim maintenance

- https://github.com/neovim/libvterm
- perl で `encoding/*.inc` を生成する必要あり

# original

- https://www.leonerd.org.uk/code/libvterm/
- perl で `encoding/*.inc` を生成する必要あり

## 0.3.3 @2023

# API

## VTermScreenCallbacks

```c
typedef struct {
  int (*damage)(VTermRect rect, void *user);
  int (*moverect)(VTermRect dest, VTermRect src, void *user);
  int (*movecursor)(VTermPos pos, VTermPos oldpos, int visible, void *user);
  int (*settermprop)(VTermProp prop, VTermValue *val, void *user);
  int (*bell)(void *user);
  int (*resize)(int rows, int cols, void *user);
  int (*sb_pushline)(int cols, const VTermScreenCell *cells, void *user);
  int (*sb_popline)(int cols, VTermScreenCell *cells, void *user);
  int (*sb_clear)(void* user);
} VTermScreenCallbacks;
```

## forkpty

`posix`

## conpty

`windows`
[[conpty]]

- [ConPTY を叩く · Issue #1183 · vim-jp/issues · GitHub](https://github.com/vim-jp/issues/issues/1183)

# App

- [GitHub - new299/hackterm: experimental sdl based terminal with gnu unifont font rendering using libvterm](https://github.com/new299/hackterm)
- [~sircmpwn/scurvy - sourcehut git](https://git.sr.ht/~sircmpwn/scurvy)

## SDL

- [GitHub - palomena/sdlterm: SDL2 Terminal Emulator based on libvterm and sdlfox](https://github.com/palomena/sdlterm)
- [SDL2 terminal emulator using libvterm · GitHub](https://gist.github.com/shimarin/71ace40e7443ed46387a477abf12ea70)

## qt

[[qt]]

- [GitHub - jsbronder/sff: A terminal, using libvterm and Qt](https://github.com/jsbronder/sff)
- [GitHub - ohwgiles/quilte: Lightweight Qt Terminal Emulator](https://github.com/ohwgiles/quilte)

## sfml

- [GitHub - Edgaru089/Terminal: A terminal emulator based on libvterm and SFML](https://github.com/Edgaru089/Terminal)

## multiplexer

- [GitHub - magiblot/tvterm: A terminal emulator that runs in your terminal. Powered by Turbo Vision.](https://github.com/magiblot/tvterm)
- [GitHub - mohemohe/wmux: windowed terminal multiplexer](https://github.com/mohemohe/wmux)
- [GitHub - cantora/ncte: ncurses based terminal emulator (using libvterm)](https://github.com/cantora/ncte)

## pangoterm

- [pangoterm in Launchpad](https://launchpad.net/pangoterm)
