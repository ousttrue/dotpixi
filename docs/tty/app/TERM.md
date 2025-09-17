- @2000 [Text-Terminal-HOWTO](https://linuxjf.osdn.jp/JFdocs/Text-Terminal-HOWTO.html)

# env:TERM

端末の種類を示す環境変数

## termcap

`term.h`

- tput
- tgoto

## terminfo

[[terminfo]]

- [Ubuntuでxterm-256colorのterminfoがないと怒られた - 絶品ゆどうふのタレ](https://yudoufu.hatenablog.jp/entry/20100930/1285813510)
- [Ubuntuでターミナルエミュレータにtmux-256colorを使う - 消えたアンダーバー](https://akahana-1.hatenablog.jp/entry/2017/11/07/153741)

# termcap / terminfo と VT100 などの escape sequence

機能名と escape sequence の key / value store.
key 銘が termcap と terminfo で異なる。
端末名(ENV:TERM)をキーに、機能リストを取得できる。

# libs

- https://github.com/KazDragon/terminalpp

- https://github.com/AmokHuginnsson/replxx
