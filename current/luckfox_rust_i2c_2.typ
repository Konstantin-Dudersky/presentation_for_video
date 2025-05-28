// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_i2c_2.typ --root . current/luckfox_rust_i2c_2.pdf

#import "../style/style.typ": style

#let i2c = [I#super[2]C]

#show: style.with(
  header: [Luckfox - #i2c],
  title: [Luckfox Lyra - опрос устройств по протоколу #i2c],
)

= #i2c

= Создание проекта

```bash
cargo new i2c
cargo add i2cdev
```

= Сборка

```bash
cargo build --target="armv7-unknown-linux-gnueabihf" --release; scp target/armv7-unknown-linux-gnueabihf/release/i2c root@target:/root/
```

= Преобразуем в значения

```bash
cargo add bitvec
```
