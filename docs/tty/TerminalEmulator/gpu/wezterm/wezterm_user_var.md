https://wezterm.org/shell-integration.html

`OSC 1337` iTerm2

`base64必須!`

- https://www.ascii-code.com/

- https://ikorihn.github.io/digitalgarden/note/wezterm

# set

## sh

```sh
printf "\033]1337;SetUserVar=%s=%s\007" foo `echo -n bar | base64`
```

- [Proprietary Escape Codes - Documentation - iTerm2 - macOS Terminal Replacement](https://iterm2.com/documentation-escape-codes.html)

## pwsh

https://github.com/wezterm/wezterm/issues/522?timeline_page=1

https://seesaawiki.jp/w/kou1okada/d/20210624%3A%20PowerShell%20-%20ANSI%20Escape%20Sequence

# get

- [get_user_vars - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/lua/pane/get_user_vars.html)

# event: user-var-changed

- [user-var-changed - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/config/lua/window-events/user-var-changed.html)

```lua
wezterm.on('user-var-changed', function(window, pane, name, value)
  wezterm.log_info('var', name, value)
end)
```
