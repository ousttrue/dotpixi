https://clang.llvm.org/docs/ClangFormatStyleOptions.html

- [clang-format configurator](https://zed0.co.uk/clang-format-configurator/)
- [clang-format を イイ感じに設定する - def yasuharu519(self):](https://yasuharu519.hatenablog.com/entry/2015/12/13/210825)
- [clang-format を導入してカスタマイズした :: プログラマになりたい人生 — プログラマになりたいおじさんの日記](https://blog.takuchalle.dev/post/2018/04/26/setup_clang_format/)
- [Clang-Formatの書式について #C++ - Qiita](https://qiita.com/koyukitukimino/items/9b8f74d1ae307a7017d3)

# Version

## 22

## 21

- https://releases.llvm.org/21.1.0/tools/clang/docs/ClangFormatStyleOptions.html

# 名前

|     |                    |
| --- | ------------------ |
|     | brace, bracket     |
|     | wrap, break, align |
|     | indent, offset     |

# まとめて適用

```sh
find foo/bar/ -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i
```

# 新規

```
$ clang-format -style=llvm -dump-config > .clang-format
```

# `.clang-format`

## nvim

`.clang-format` にエラーがあると黙ってデフォルト設定で実行する。
LspLog に注意 !

## sample 1

```.yml
BasedOnStyle: WebKit
SortIncludes: false
PointerAlignment: Right
BreakBeforeBraces: Attach
```

## fbterm

```.yml
BasedOnStyle: WebKit
SortIncludes: false
UseTab: Always
IndentWidth: 2
TabWidth: 2
AccessModifierOffset: -2
PointerAlignment: Right
AllowShortIfStatementsOnASingleLine: true
```

## sample 2

```yml
BasedOnStyle: LLVM
# AllowShortIfStatementsOnASingleLine: false
# AllowShortBlocksOnASingleLine: false
AllowShortFunctionsOnASingleLine: false
AccessModifierOffset: -4
BreakBeforeBraces: Allman # かっこの位置
IndentCaseLabels: false # switch case
IndentWidth: 4
SortIncludes: false
UseTab: Never
ColumnLimit: 0
TabWidth: 4
```

# vscode

`.vscode/settings.json`

```json
// 親フォルダに遡って .clang-formatを探す。project-rootにおいておくべし
{
  "C_Cpp.clang_format_style": "file"
}
```
