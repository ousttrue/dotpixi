https://github.com/glanceapp/glance

```sh
glance --config glance.yml
```

```yml title="glance.yml"
pages:
  - name: Home
    columns:
      - size: full
        widgets:
          - type: calendar
            first-day-of-week: sunday
```

- @2026 [glanceで自分好みのダッシュボードをセルフホストする - とことんDevOps | 日本仮想化技術のDevOps技術情報メディア](https://devops-blog.virtualtech.jp/entry/20260116/1768547109)
- @2025 [自己ホスト型のダッシュボードアプリGlanceを試す](https://zenn.dev/slowhand/articles/3456bef86fd503)
- @2025 [glanceでpersonal dashboard](https://medium.com/@yusuke_h/%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E3%81%8C%E3%83%80%E3%82%B5%E3%81%84%E3%81%A8%E3%83%A2%E3%83%86%E3%81%AA%E3%81%84-glance%E3%81%A7personal-dashboard-a402f94490ae)

## theme

- https://codeberg.org/meikel_garvey/Privat-Glance-Dashboard

## systemd

- https://github.com/nicolargo/glances/wiki/Start-Glances-through-Systemd

## widgets

- https://github.com/glanceapp/glance/blob/main/docs/configuration.md

### calendar
