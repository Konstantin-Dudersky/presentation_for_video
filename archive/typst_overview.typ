// typst watch --ignore-system-fonts --font-path ./fonts current/typst_overview.typ --root . current/typst_overview.pdf

#import "../style/style.typ": style

#show: style.with(
  header: [Typst - обзор],
  title: [Обзор Typst - система оформления документов],
)

= В чём оформлять документы

Что можно использовать:
- Word, LibreOffice
- #link("https://ru.wikipedia.org/wiki/LaTeX")[TeX, LaTeX]
- #link("https://ru.wikipedia.org/wiki/Markdown")[Markdown]
- #link("https://typst.app")[Typst]

= Установка

- Онлайн-редатор
- Установка оффлайн, Github-репозиторий - https://github.com/typst/typst

Актуальная версия 0.13.1

Вывод в pdf, html (в разработке)

= Порядок работы

- Создаём текст в текстовом редакторе с поддержкой синтаксиса:
  - Visual Studio Code
  - Zed

- Собираем документ с командой `typst compile`
- Собираем документ с командой `typst watch`

= Структура файла

- Оглавление
- Описание
- Схема
- Печатная плата
- Прошивка
  - Конфигурация
  - Исходный код
- Библиография

= Простой проект в Kicad

= Вставка изображений

```typst
#figure(
  caption: "Схема",
  image("name.svg",
    width: 100%
  ),
)
```

= Вставка таблиц

```typst
#figure(
  table(
    columns: 3,
    table.header(
      [*Обозначение*],
      [*Количество*],
      [*Артикул*]
    ),
    [R], [2], [R_10k_0606_1%]
  )
)
```

= Загрузка данных из `.csv`

```typst
// Загрузить данные с перечнем элементов
#let load_bom(path) = {
  let results = csv(path, row-type: dictionary)
  let results = results.map(el => {
    let reference = el.reference.replace(",", ", ")
    let quantity = el.quantity
    let part_ipn = el.part_ipn
    (reference, quantity, part_ipn)
  })
  results.flatten()
}
```

```typst
// Вывести таблицу с перечнем элементов
#let table_bom(
  name: "plate_name",
  path: "bom.csv",
) = {
  let bom = load_bom(path)

  figure(
    caption: "Перечень элементов платы " + name,

    table(
      columns: (35%, 15%, 50%),
      table.header(
        repeat: true,
        [*Обозначение*],
        [*Количество*],
        [*part_ipn*],
      ),
      ..bom,
    ),
  )
}
```

= Вставка формул

```typst
$ cases(
  I_2 = I_1 + I_"TH",
  U_F = I_2 dot R_2 + I_1 dot R_1,
  U_"TH" = I_1 dot R_1
) $ <kirhgoff>
```

= Вставка файла с кодом

```typst
 #let code = read("./firmware/Cargo.toml")
```

#pagebreak()

```typst
/// Отображение листинга кода.
#let listing(content, caption, label) = {
  set par(justify: false)
  [
    #figure(
      block(
        fill: luma(250),
        radius: 3pt,
        stroke: .6pt + luma(200),
        inset: (x: .45em, y: .65em),
        width: 100%,
        clip: false,
        [#align(left)[#content]]
      ),
      caption: [#caption],
      supplement: "Листинг",
      kind: "code",
    ) #label
  ]
}
```

= Вставка части файла с кодом

```typst
/// Изъять отрезок строки иежду двумя маркерами.
//
/// Начало и конец помечаются комментарием:
//
// // ANCHOR: name
//
#let extract_anchor(
  content,
  anchor
) = {
  content
    .split("// ANCHOR: " + anchor)
    .at(1)
    .trim(regex("[\n]"))
}
```

= Библиография

Файл `bibliography.yml`

```yml
reactive_design_patterns:
  type: Book
  title: Реактивные шаблоны проектирования
  author: Роланд Кун
  date: 2020
  publisher: Издательский дом "Питер"
```

```typst
#bibliography("./bibliography.yml")
```

= Глобальный стиль

```sh
typst watch --ignore-system-fonts --font-path ./fonts
```

https://typst-gost.ru

= Сборка файла из нескольких файлов

```typst
#include "pcb.typ"
```
