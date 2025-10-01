
# span

```c
// ?
const Point = struct {
    x: f32,
    y: f32,
};

fn show_points(
    arg: []Point // 見れない。最適化？違うmemoryレイアウトになっていそう
) void
{
    const local: []Point = arg; // ローカル変数は見れる
}
```
