# hererocks

- [GitHub - luarocks/hererocks: Python script for installing Lua/LuaJIT and LuaRocks into a local directory](https://github.com/luarocks/hererocks)
- [Windows環境にluarocksをインストールするにはhererocksが便利 | Birth, Gaming, Gaming, Death](https://bggd.github.io/2019/12/20/hererocks-on-windows.html)

`$ pip install hererocks`

```
$ pip install git+https://github.com/luarocks/hererocks
```

```sh
> hererocks luarocks -j latest -r latest
> find luarocks/ -not -path 'luarocks/share/*'
luarocks/
    hererocks.manifest
    lib/
        libluajit-5.1.a
        libluajit-5.1.so.2
    bin/
        lua
        luarocks
        activate.csh
        luarocks-admin
        get_deactivated_path.lua
        activate.fish
        activate
        activate_posix
    etc/
        luarocks/
            config-5.1.lua
    include/
        lua.hpp
        luajit.h
        lualib.h
        lauxlib.h
        luaconf.h
        lua.h
    share/
        lua/
            *.lua
```
