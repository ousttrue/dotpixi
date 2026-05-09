## Dr. Konqi 

- https://bbs.archlinux.org/viewtopic.php?id=301585
- https://discuss.kde.org/t/why-does-dr-konqi-think-kate-is-crashing-when-closed/43461

```
> systemctl list-units --state=failed
  UNIT                                                       LOAD   ACTIVE SUB    DESCRIPTION                                            >
● drkonqi-coredump-processor@129-24605-32516_32517-0.service loaded failed failed Pass systemd-coredump journal entries to relevant user >
● drkonqi-coredump-processor@320-16476-56560_56561-0.service loaded failed failed Pass systemd-coredump journal entries to relevant user >
● drkonqi-coredump-processor@345-16480-60138_60139-0.service loaded failed failed Pass systemd-coredump journal entries to relevant user >
● drkonqi-coredump-processor@395-16497-68009_68010-0.service loaded failed failed Pass systemd-coredump journal entries to relevant user >
● drkonqi-coredump-processor@5-8195-19505_19506-0.service    loaded failed failed Pass systemd-coredump journal entries to relevant user >
● drkonqi-coredump-processor@633-4258-86196_86197-0.service  loaded failed failed Pass systemd-coredump journal entries to relevant user >
```
