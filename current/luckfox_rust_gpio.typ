
// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_gpio.typ --root . current/luckfox_rust_gpio.pdf

#import "../style/style.typ": style

#show: style.with(
  header: "Luckfox - GPIO",
  title: "Luckfox Lyra - взаимодействие с GPIO на Rust",
)

= GPIO

General-purpose input/output

gpioinfo - добавить в buildroot

= Нумерация пинов

$ "Номер" = "Группа" dot 8 + X $

A = 0; B = 1; C = 2; D = 3;



Пример из sysfs - deprecated. Рекомендуется через userspace API. Папка /dev.
= Создание проекта

```bash
cargo new gpio
```
