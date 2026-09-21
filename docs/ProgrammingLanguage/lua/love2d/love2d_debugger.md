# lua-local で break できる

- https://zenn.dev/m9m/scraps/52a88a63cdd1f4

`./vscode/launch.json`

- program: love.exe
- scriptRoots

があれば動く。

- cwd を指定することで scriptRoots を省略することもできる

```lua
require("lldebugger").start()
```

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "hello",
            "type": "lua-local",
            "request": "launch",
            "program": {
                "command": "${workspaceFolder}/love2d/love.exe"
            },
            "cwd": "${workspaceFolder}/src/hello",
            "args": [
                "."
            ],
            // "scriptRoots": [
            //     "."
            // ]
        }
    ]
}
```

