# zig-0.14

https://ziggit.dev/t/allocator-vtable-creation-in-standard-library/5435

```zig
pub fn allocator(self: *Self) Allocator {
    return .{
        .ptr = self,
        .vtable = &.{
            .alloc = alloc,
            .resize = resize,
            .free = free,
        },
    };
}
```

## boehm-gc の例 zig-0.14

https://github.com/mitchellh/zig-libgc

# zig-0.15

https://ziglang.org/documentation/0.15.1/#Implementing-an-Allocator

https://ziglang.org/documentation/master/std/#std.mem.Allocator.VTable

```zig
// std.mem.Allocator.VTable
pub const VTable = struct {
    alloc: *const fn (*anyopaque, len: usize, alignment: Alignment, ret_addr: usize) ?[*]u8,
    resize: *const fn (*anyopaque, memory: []u8, alignment: Alignment, new_len: usize, ret_addr: usize) bool,
    remap: *const fn (*anyopaque, memory: []u8, alignment: Alignment, new_len: usize, ret_addr: usize) ?[*]u8,
    free: *const fn (*anyopaque, memory: []u8, alignment: Alignment, ret_addr: usize) void,
};
```

## std.heap.raw_c_allocator

```zig
const raw_c_allocator_vtable: Allocator.VTable = .{
    .alloc = rawCAlloc,
    .resize = rawCResize,
    .remap = rawCRemap,
    .free = rawCFree,
};

fn rawCAlloc(
    context: *anyopaque,
    len: usize,
    alignment: Alignment,
    return_address: usize,
) ?[*]u8 {
    _ = context;
    _ = return_address;
    assert(alignment.compare(.lte, .of(std.c.max_align_t)));
    // Note that this pointer cannot be aligncasted to max_align_t because if
    // len is < max_align_t then the alignment can be smaller. For example, if
    // max_align_t is 16, but the user requests 8 bytes, there is no built-in
    // type in C that is size 8 and has 16 byte alignment, so the alignment may
    // be 8 bytes rather than 16. Similarly if only 1 byte is requested, malloc
    // is allowed to return a 1-byte aligned pointer.
    return @ptrCast(c.malloc(len));
}

fn rawCResize(
    context: *anyopaque,
    memory: []u8,
    alignment: Alignment,
    new_len: usize,
    return_address: usize,
) bool {
    _ = context;
    _ = memory;
    _ = alignment;
    _ = new_len;
    _ = return_address;
    return false;
}

fn rawCRemap(
    context: *anyopaque,
    memory: []u8,
    alignment: Alignment,
    new_len: usize,
    return_address: usize,
) ?[*]u8 {
    _ = context;
    _ = alignment;
    _ = return_address;
    return @ptrCast(c.realloc(memory.ptr, new_len));
}

fn rawCFree(
    context: *anyopaque,
    memory: []u8,
    alignment: Alignment,
    return_address: usize,
) void {
    _ = context;
    _ = alignment;
    _ = return_address;
    c.free(memory.ptr);
}


```
