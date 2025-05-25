// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_gpio_2.typ --root . current/luckfox_rust_gpio_2.pdf

#import "../style/style.typ": style

#show: style.with(
  header: "Luckfox - GPIO 2",
  title: "Luckfox Lyra - взаимодействие с GPIO на Rust. Часть 2",
)

= Создание проекта

```bash
cargo new gpio
cargo add gpio-cdev
```

= Управление светодиодом циклически

```rust
let mut chip = Chip::new("/dev/gpiochip2").unwrap();
let led = chip
    .get_line(14)
    .unwrap()
    .request(LineRequestFlags::OUTPUT, 0, "LED")
    .unwrap();
```

= Сборка и загрузка

```bash
cargo build --target="armv7-unknown-linux-gnueabihf" --release; scp target/armv7-unknown-linux-gnueabihf/release/gpio root@target:/root/
```

= Управление выходом по кнопке

- Свой планировщик
- Несколько потоков
- Асинхронное программирование

= Асинхронное выполнение

Добавить в Cargo.toml tokio, futures

```rust
let mut events = AsyncLineEventHandle::new(
    button
        .events(
            LineRequestFlags::INPUT,
            EventRequestFlags::BOTH_EDGES,
            "gpioevents",
        )
        .unwrap(),
)
.unwrap();
```
