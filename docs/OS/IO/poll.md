|        | Linux | Windows                |
| ------ | ----- | ---------------------- |
| poll   | epoll | WaitForMultipleObjects |
| tty    | pty   | conpty                 |
| timer  | epoll | CreateWaitableTimer    |
| signal | epoll | SetConsoleCtrlHandler  |
| socket | epoll |                        |
| cancel |       |                        |

line(coocked), cbreak, raw

