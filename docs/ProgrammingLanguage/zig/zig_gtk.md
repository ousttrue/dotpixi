https://gi.readthedocs.io/en/latest/

https://gi.readthedocs.io/en/latest/writingbindings/libgirepository.html

# pixi

```sh
pixi add gtk4 glib zlib expat pkg-config gobject-introspection
```

```toml
[dependencies]
gtk4 = ">=4.14.1,<5"
pkg-config = ">=0.29.2,<0.30"
gobject-introspection = ">=1.84.0,<2"
glib = ">=2.86.0,<3"
zlib = ">=1.3.1,<2"
expat = ">=2.7.1,<3"
```

# .pixi/envs/default/Library/share/gir-1.0

`.gir` xml

# .pixi/envs/default/Library/lib/girepository-1.0

`.typelib` binary

# translate-C

動かない

# https://github.com/DerryAlex/zig-gir-ffi

`manual/core.zig` ビルド通らず

# https://github.com/ianprime0509/zig-gobject

- https://github.com/ianprime0509/zig-gobject/blob/main/doc/binding-strategy.md

`ok` `libxslt` `crlf`
