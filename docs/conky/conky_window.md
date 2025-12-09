https://github.com/brndnmtthws/conky/wiki/Window-Configuration

# wayland wlr-layer-shell

```lua
-- ~/.config/conky/conky.conf
conky.config = {
    out_to_x = false,
    out_to_wayland = true,
};
```

# pos

```lua
conky.config = {
    alignment = 'top_right',
    gap_x = 15,
    gap_y = 15,
    minimum_width = 280,
    maximum_width = 280,
}
```

# multi monitor

## x11

```lua
conky.config = {
  xinerama_head = 1,
}
```
