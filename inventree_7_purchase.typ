// typst watch --ignore-system-fonts --font-path ./fonts inventree_7_purchase.typ  inventree_7_purchase.pdf

#import "style/style.typ": style

#show: style.with(
  header: "Остатки",
  title: "InvenTree - покупка",
)

= Производители и поставщики

#pagebreak()

= Заказы на закупку

- конкретный заказ = конкретный поставщик
- Статус заказа:
  - В ожидании
  - Размещен
  - Готово
  - На удержании
  - Отменено
- Фильтрация
- Выгрузка в таблицу
- Печать отчета

#pagebreak()

= Создание заказа

- Добавляем позиции
  - Из заказа
  - Из деталей
  - Из производства
- Экспорт в таблицу
