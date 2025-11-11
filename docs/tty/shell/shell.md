- [コマンドラインシェル - ArchWiki](https://wiki.archlinux.jp/index.php/%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%83%A9%E3%82%A4%E3%83%B3%E3%82%B7%E3%82%A7%E3%83%AB)
- [GitHub - alebcay/awesome-shell: A curated list of awesome command-line frameworks, toolkits, guides and gizmos. Inspired by awesome-php.](https://github.com/alebcay/awesome-shell)
- @2022 [シェルの歴史 総まとめ（種類と系統図）と POSIX の役割 〜 シェルスクリプトの現在・過去・未来【POSIX 改訂間近】 - Qiita](https://qiita.com/ko1nksm/items/e7f43428352c0b4c78f9)

| shell  | Windows | Linux | memo                      |
| ------ | ------- | ----- | ------------------------- |
| bash   | x       | o     |                           |
| pwsh   | o       | o     |                           |
| xonsh  | o       | o     | xonsh script が微妙       |
| nyagos | o       | o     | Windows以外はちょっと弱い |

# shell

- https://github.com/PhilippRados/PShell?tab=readme-ov-file

# repl

- prompt
- hisory search: `c-n`, `c-p`
- completion: `tab`
- pipe / redirection
- `~` expansion
- `glob` expansion

- scripting は別に必須ではないのでは？
- 環境変数を設定できればよい。

## input

- repl
  - rawinput
  - readline edit
  - history
- output prompt

## posix

- [Tutorial - Write a Shell in C • Stephen Brennan](https://brennan.io/2015/01/16/write-a-shell-in-c/)
- @2021 [Rust で始める自作シェル その 1 - ぶていのログでぶログ](https://tech.buty4649.net/entry/2021/12/19/235124)
- [GitHub - buty4649/rbsh: Ruby-powerd shell.](https://github.com/buty4649/rbsh)

# Windows

- [[msys2]]
- [[clink]]
- [Elvish Shell](https://elv.sh/)

# Unix

- [[bash]]
- [[fish]]

# Both

- [[nushell]]
- [[powershell]]
- [[xonsh]]
- [[nyagos]]

# features

## mkdir, cd, pushd, popd, z

## cp, mv, rm, ln

- [[coreutils]]
- [[busybox]]

## env, execute, shbang

## history, completion

## output, kitty

## copy, paste
