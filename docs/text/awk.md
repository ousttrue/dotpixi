https://www.gnu.org/software/gawk/manual/gawk.html

http://itmst.blog71.fc2.com/blog-entry-57.html

# command line

```sh
$ cat src.txt | awk -f script.awk
```

# pattern

```
$0 ~ /itmst/
```

> $0は入力行全体を表す。$1、$2・・・などはそれぞれ行中の１番目のフィールド、２番目フィールド・・・を表す
> ~ （チルダ）で左辺（$0）に右辺のパターン（itmst）が含まれるかをチェック
