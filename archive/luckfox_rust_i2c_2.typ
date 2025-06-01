// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_i2c_2.typ --root . current/luckfox_rust_i2c_2.pdf

#import "../style/style.typ": style

#let i2c = [I#super[2]C]

#show: style.with(
  header: [Luckfox - #i2c],
  title: [Luckfox Lyra - опрос устройств по протоколу #i2c],
)

= Создание проекта

```bash
cargo new i2c
cargo add i2cdev
```

= Программа

Доступ к адаптеру:

```rust
let mut dev = LinuxI2CDevice::new("/dev/i2c-0", 0x38).unwrap();
```

Чтение / запись:

```rust
let mut msgs = [
    LinuxI2CMessage::write(&[0xAC, 0x33, 0x00]),
    LinuxI2CMessage::read(&mut read_data),
];

dev.transfer(&mut msgs).unwrap();
```

= Сборка

```bash
cargo build --target="armv7-unknown-linux-gnueabihf" --release; scp target/armv7-unknown-linux-gnueabihf/release/i2c root@target:/root/
```

= Преобразуем в значения

```bash
cargo add bitvec
```
