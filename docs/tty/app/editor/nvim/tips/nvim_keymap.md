`verbose` で調べる

- [Map - Neovim docs](https://neovim.io/doc/user/map.html#:map-arguments)
- [[第3回] Neovimのすゝめ – キーマップを作成する │ wonwon eater](https://wonwon-eater.com/neovim-susume-keymap/#outline__3)

# vim.api

## vim.api.nvim_set_keymap

## vim.api.nvim_buf_set_keymap

👇

# vim.keymap.set

便利関数。lua の関数を直接引数に取れて便利

# jump

| key | cmd | action           |
| --- | --- | ---------------- |
| tab |     | history front    |
| c-o |     | history back     |
| c-n | cn  | quickfix next    |
| c-p | cp  | quickfix prev    |
|     |     | diagnostics next |
|     |     | diagnostics prev |
| c-f |     | page down        |
| c-b |     | page up          |
| ]d  |     | next diagnostics |
| [d  |     | prev diagnostics |
| gd  |     | }                |
| gf  |     | }                |
| gx  |     | }                |

# 汎用

## q

## F

## K

## c-e

## c-l

## c-s

## `c-[`

## `c-/`

# prefix

## `<Leader>`

## `<Plug>`

`mapleader`
`maplocalleader`

## g

### gf

## z

## `,`

# command

```
"<cmd>Neoformat<CR>"
```
