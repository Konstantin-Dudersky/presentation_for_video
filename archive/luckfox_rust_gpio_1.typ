// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_gpio_1.typ --root . current/luckfox_rust_gpio_1.pdf

#import "../style/style.typ": style

#show: style.with(
  header: "Luckfox - GPIO 1",
  title: "Luckfox Lyra - взаимодействие с GPIO на Rust. Часть 1",
)

= GPIO

General-purpose input/output

wiki

Пример из sysfs - deprecated. Рекомендуется через userspace API. Папка /dev.

= Схема


= Нумерация пинов

$ "Номер" = "Группа" dot 8 + X $

A = 0; B = 1; C = 2; D = 3;

Кнопка = chip0; C0 = 16

Светодиод = chip2; B6 = 14

= libgpiod

libgpiod (добавить в buildroot: Target packages -> Libraries -> Hardware handling):
- gpiodetect
- gpioinfo
- gpioget
- gpioset
- gpiofind
- gpiomon

= Далее

Создание проекта на языке Rust.
