https://ziglang.org/learn/build-system/

- https://smntin.github.io/blog/2025/zig-build-embed/

- https://github.com/akunaakwei/zig-patch/blob/main/PatchStep.zig
- https://github.com/allyourcodebase/libgit2/blob/main/ClarTestStep.zig
- https://github.com/cbilz/gnu-m4-zig/blob/main/InsertHeaderSnippets.zig
- https://github.com/geooot/zig-sokol-crossplatform-starter/blob/main/build/FetchFile.zig

```zig
const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "hello",
        .root_source_file = b.path("hello.zig"),
        .target = b.host,
    });

    b.installArtifact(exe);
}
```

# Options for Conditional Compilation

`build.zig` から `main.zig` に comptime 定数を送り込む。

# Generating Files

## from tool

```build.zig
const output = tool_step.addOutputFileArg("word.txt");
b.addInstallFileWithDir(output, .prefix, "word.txt");
```

## from tool (make tool by zig)

# Generating Zig Source Code

- `has_side_effects` @2024 [Zigでビルド時にZig依存を作る](https://zenn.dev/mkpoli/articles/620223f8054b03)

```build.zig
const output = tool_step.addOutputFileArg("person.zig");
exe.root_module.addAnonymousImport("person", .{
  .root_source_file = output,
});
```

# Dealing With One or More Generated Files

# Mutating Source Files in Place

# cache, manifest

https://ziglang.org/documentation/0.15.1/std/#std.Build.Cache.Manifest

```zig
var man = b.graph.cache.obtain();
defer man.deinit();
```

## cacheHitAndWatch

https://github.com/allyourcodebase/libgit2/blob/0a30de316f8455dfd0429bc90a6ab27d98d957df/ClarTestStep.zig#L56

```zig
// LazyPath from manifest
    if (try step.cacheHitAndWatch(&man)) {
        const digest = man.final();
        patch.generated_directory.path = try b.cache_root.join(b.allocator, &.{ "o", &digest });
        return;
    }
```
