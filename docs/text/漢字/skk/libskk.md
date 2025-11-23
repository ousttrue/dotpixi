`~/.config/libskk/rules`

- [ skkの各種設定について | 自ら環境を構築して執筆するブログ ](https://blog.takef-n.com/entry/post047/)

# keymap `~/.config/libskk/rules/CONFIG/keymap/latin.json`

```json
{
  "include": ["default"],
  "define": {
    "keymap": {
      "C-'": "set-input-mode-hiragana",
       // <C-Space>
      "C- ": "set-input-mode-hiragana"
    }
  }
}
```
