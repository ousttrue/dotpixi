https://wiki.archlinux.org/title/Alacritty
https://yukimemi.netlify.app/use-alacritty/

- @2020 [Windowsで至高のターミナル生活を求めて(Alacritty編) : ビジネスとIT活用に役立つ情報（株式会社アーティス）](https://blog.asobou.co.jp/web/alacritty)

# version

https://alacritty.org/changelog.html

## 0.17.0 @2026

# font

- `HackGen` [Alacrittyにフォントを設定する方法とHackGenについて - RYOSUKE.dev](https://ryo-morimoto-dev.hatenablog.com/entry/2025/06/06/005518)

# toml

`$env:APPDATA/alacritty/alacritty.toml`

# yml => toml

`$env:APPDATA/alacritty/alacritty.yml`

# keybinding

"<C-/>"

```toml
# https://github.com/alacritty/alacritty/issues/7608
[[keyboard.bindings]]
key = "Slash"
mods = "Control"
chars   = "\u001f"
```
