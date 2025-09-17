- @2025 [Linuxでepollを使ってみる](https://zenn.dev/dameyodamedame/articles/59cab0f2c975b0)

# epoll_create, epoll_create1

https://manpages.ubuntu.com/manpages/jammy/ja/man2/epoll_create.2.html

```c
#include <sys/epoll.h>

int epoll_create(int size);
int epoll_create1(int flags);
```

> Linux 2.6.8 以降では、size 引き数は無視されるが、 0 より大きな値で なければならない

```c
// これ
int epfd = epoll_create1(EPOLL_CLOEXEC);
if(epfd==-1){
    // error
}
```

可始末以 `close`

```c
#include <unistd.h>
int close(int fd);
```

# epoll_wait

```c
int epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout);
```
