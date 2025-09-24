exe を copy するだけではだめ。

```sh
zls> New-Item -ItemType SymbolicLink -Path ~/local/bin/zls.exe -Target "$(pwd)\zig-out\bin\zls.exe"
```
