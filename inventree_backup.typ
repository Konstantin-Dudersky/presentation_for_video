// typst compile --ignore-system-fonts --font-path ./fonts inventree_backup.typ  inventree_backup.pdf

#import "style/style.typ": style

#show: style.with(
  header: "Создание бекапов",
  title: "Создание бекапов и восстановление из бекапа",
)

= Документация

- https://docs.inventree.org/en/stable/start/backup/#data-backup

- Находится в папке `./inventree-data/backup`

- invoke вызывать из контейнера

#pagebreak()

= Создание бекапа

```
docker compose run --rm inventree-server invoke backup
```

#pagebreak()

= Восстановление из бекапа

```
docker compose run --rm inventree-server invoke restore
```

#pagebreak()

= Автоматическое создание бекапа

Системные настройки
