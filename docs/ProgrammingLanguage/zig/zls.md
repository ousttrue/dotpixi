https://zigtools.org/zls/install/

# 設定

https://github.com/zigtools/zls/blob/master/schema.json

## zls.json

```sh
> zls env
{
 "version": "0.16.0-dev.14+829f566c",
 "global_cache_dir": "C:\\Users\\ousttrue\\AppData\\Local\\Temp\\zls",
 "global_config_dir": "C:\\ProgramData",
 "local_config_dir": "C:\\Users\\ousttrue\\AppData\\Local",
 "config_file": "C:\\Users\\ousttrue\\AppData\\Local\\zls.json",
 "log_file": "C:\\Users\\ousttrue\\AppData\\Local\\Temp\\zls\\zls.log"
}
```

及び `PROJOECT/zls.build.json`

## builder

```json
// zls.json
{
  "build_runner_path": ""
}
```

exe を copy するだけではだめ。たぶん builder を見つけられるようにしてやる。
symbolic link 例。

```sh
zls> New-Item -ItemType SymbolicLink -Path ~/local/bin/zls.exe -Target "$(pwd)\zig-out\bin\zls.exe"
```

## Build-On-Save

https://zigtools.org/zls/guides/build-on-save/

どっちか必要

- The build.zig of your project defines a “check” step. (recommended)
- The enable_build_on_save config option has been manually set to true.

```json
// zls.json
{
  "enable_build_on_save": true
}
```

```zig
const exe_check = b.addExecutable(.{
    .name = "foo",
    .root_module = exe_mod,
});
const check = b.step("check", "Check if foo compiles");
check.dependOn(&exe_check.step);
```

- but we never install it

# b.addTranslateC が位置ファイルで消えてしまっている

[ERROR][2025-09-27 16:35:45] ...lsp/handlers.lua:562 "failed to read document 'e:/repos/github.com/ousttrue/sokol-xr/hello_xr/.zig-cache/tmp/3a5eb4d0882d6946/dependencies.zig': error.FileNotFound"

# debugger アタッチできるように TCP mode
