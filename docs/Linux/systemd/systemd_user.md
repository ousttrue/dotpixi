- [サーバー起動時に非rootユーザーでsystemdを使ってサービスを立ち上げる #systemd - Qiita](https://qiita.com/k0kubun/items/3c94473506e0e370a227)
- @2022 [cron で systemctl --user を使う方法 (Failed to connect to bus... の解決法)](https://zenn.dev/noraworld/articles/systemctl-user-cron)
- @2020 [ユーザー権限のsystemdにFailed to connect to busで繋がらない時の対処方法 - @znz blog](https://blog.n-z.jp/blog/2020-06-02-systemd-user-bus.html)

# user.slice

https://www.freedesktop.org/software/systemd/man/latest/systemd.slice.html

## session.slice

## app.slice

## background.slice

# environment variables

```sh
$ systemctl --user show-environment
```
