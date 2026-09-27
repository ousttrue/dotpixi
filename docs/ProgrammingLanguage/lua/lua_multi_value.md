```lua
local a, b, c = get_table()
```

のような多重代入ができる。
しかし、

```lua
local t = {1, 2, 3}
local a, b, c = t
```

のようなマッチング分解のことはできない。何故か。

すなわち、関数の出入り口でのスタックに対する、多重代入なのである。

```lua
function return_mult()
    return 1, 2, 3
end

local a, b, c = return_mult()
```

タプルの分解のイメージでは使えん。

## 関連して table.unpack

table.unpack により、テーブルの中身を複数 return することで分解できるのである。

```lua
local a, b, c = table.unpack({1, 2, 3})
```

## 関連して `...`

たぶん以下のようなことが可能

```lua
function vararg(...)
    local t = {...}
    local a, b, c = ...
end
```

