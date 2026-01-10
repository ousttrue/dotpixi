without logind

- [GitHub - fairyglade/ly: display manager with console UI](https://github.com/fairyglade/ly)

# systemd

```sh
systemctl enable ly.service --now

# 変わった

systemctl enable ly@tty2.service --now
```

# gentoo

@2025 `emerge` 無い

- https://fedang.net/posts/setting-up-ly/
