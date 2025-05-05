// typst watch --ignore-system-fonts --font-path ./fonts inventree_parts.typ  inventree_parts.pdf

#import "style/style.typ": style

#show: style.with(
  header: "Управление деталями",
  title: "InvenTree - управление деталями",
)

= Иерархия

Пример: https://lcsc.com

#pagebreak()

= Part Details

IPN - International Part Number

Штрихкод

Инвентаризация

#pagebreak()

== Атрибуты детали

- Активно
- Заблокировано
- Производимая деталь (Assembled part)
- Компонент (Component part)
- Testable
- Отслеживание (Trackable part)
- Можно купить (Purchaseable part)
- Можно продать (Saleable part)
- Виртуальная (Virtual part)
- Подписка на уведомления (Subscribed)

#pagebreak()

= Parameters

#pagebreak()

= Остатки

#pagebreak()

= Allocations

#pagebreak()

= Bill of Materials

Импорт из CSV

Пример из Kicad

#pagebreak()

= Заказы на сборку
= Заказы на продажу
= Заказы на возврат
= Заказы на закупку

Ссылки на разделы

#pagebreak()

= Used In

Для сборки каких деталей используется

#pagebreak()

= Part Pricing

- для компонентов
- для сборок

#pagebreak()

= Suppliers

- Производители (Manufacturers)
- Поставщики (Suppliers)

#pagebreak()

= Вложения

Даташиты, примеры применения

Без интернета и VPN
