// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_i2c_1.typ --root . current/luckfox_rust_i2c_1.pdf

#import "../style/style.typ": style

#let i2c = [I#super[2]C]

#show: style.with(
  header: [Luckfox - #i2c],
  title: [Luckfox Lyra - опрос устройств по протоколу #i2c],
)

= #i2c

= Схема

= Конфигурация в buildroot

Device tree

```
&i2c0 {
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&rm_io3_i2c0_scl &rm_io4_i2c0_sda>;
};
```

= Коммуникация с датчиком

AHT10

Адрес 0x38

Выполнить измерение:
- `10101100 => 0xAC`
- `00110011 => 0x33`
- `00000000 => 0x00`

Ответ:
- Статус - 1 байт
- Влажность - 2.5 байта
- Температура - 2.5 байта

= i2c-tools

Добавить в buildroot: Target packages => Hardware handling => i2c-tools

- i2cdetect
  - i2cdetect -l
  - i2cdetect -y 0
- i2ctransfer
  - `i2ctransfer -y 0 w3@0x38 0xAC 0x33 0x00`
  - `i2ctransfer -y 0 r6@0x38`
- i2cdump
- i2cget
- i2cset

= Следующее видео

Программа на Rust
