
```lua
-- ~/.conkyrc
conky.config = {
    out_to_x = false,
    out_to_console = true,
    total_run_times = 1 -- must be 1, screen will do the refreshing, not Conky.
};
```

```sh
watch "conky 2>/dev/null"
```
