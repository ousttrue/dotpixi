# std.Io

https://ziglang.org/documentation/master/std/#std.Io

## io_uring

- https://codeberg.org/ziglang/zig/pulls/31158

## GCD

- https://codeberg.org/ziglang/zig/pulls/31198

## std.Io

https://github.com/llllOllOOll/zig_threads_evented

### std.Io.Evented

- @2026 https://ziglang.org/devlog/2026/#2026-02-13
- @2026 [🤯 ZigのI/Oがマジ激変!? io_uringとGCD統合の衝撃！｜N1](https://note.com/n1_news/n/ndbc43f678f1a)

```zig
const std = @import("std");

pub fn main(init: std.process.Init.Minimal) !void {
    var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
    const gpa = debug_allocator.allocator();

    var evented: std.Io.Evented = undefined;
    try evented.init(gpa, .{
        .argv0 = .init(init.args),
        .environ = init.environ,
        .backing_allocator_needs_mutex = false,
    });
    defer evented.deinit();

    const io = evented.io();
    return app(io);
}

fn app(io: std.Io) !void {
    try std.Io.File.stdout().writeStreamingAll(io, "Hello, World!\n");
}
```

### std.Io.Threaded

- `producer consumer` @2025 [Zig's New Async I/O (Text Version) - Andrew Kelley](https://andrewkelley.me/post/zig-new-async-io-text-version.html)
