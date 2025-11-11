# ColumnLimit

改行制御

# BinPackArguments

カンマ区切りの引数リストを改行せずに続ける。

# BinPackParameters

関数引数

# BreakAfterOpenBracketBracedList `22`

```c
const int array[] = {
    1, 2, 3,
};
```

# PenaltyBreakAssignment

代入の改行。意味不明

https://stackoverflow.com/questions/65569245/clang-format-how-to-avoid-new-line-breaks

```yml
PenaltyBreakAssignment: 50
```

# AlignOperands & ContinuationIndentWidth

```c
hoge && fuga;

hoge
    && fuga;
```

```yml
AlignOperands: DontAlign
ContinuationIndentWidth: 4
```
