https://learn.microsoft.com/ja-jp/windows/console/console-virtual-terminal-sequences#screen-colors

`Operating system command ?`

- [OSC and Colour Palette](https://groups.google.com/g/lightjams/c/sXMpbTwBQuY?pli=1)

https://kmiya-culti.github.io/RLogin/ctrlcode.html#OSC

- https://manpages.ubuntu.com/manpages/noble/ja/man4/console_codes.4.html

|       |                   |     |
| ----- | ----------------- | --- |
| 0,1,2 | set wndow title   |     |
| 4     | set color pallete |     |
| 10,11 | f                 |     |
| 52    | clipboard         |     |
| 1337  | set user var      |     |

# <OSC> = `{0x1B}{0x5D}`(<ESC>])

# <ST> = `{0x1B}{0x5C}` (<ESC>\\) or `{0x07}` (<BEL>)

# brokenLinuxOSC

`not terminate`

|     |                        |     |
| --- | ---------------------- | --- |
| P   | 16 color pallete set   |     |
| R   | 16 color pallete reset |     |
