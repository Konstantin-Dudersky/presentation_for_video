// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_hello_world.typ --root . current/luckfox_rust_hello_world.pdf

#import "../style/style.typ": style

#show: style.with(
  header: "Luckfox - rust - hello world",
  title: "Luckfox Lyra - Hello world на Rust",
)

= Luckfox Lyra Ultra

#figure(
  image("images/Luckfox-Lyra-Ultra-1-1000x1000.jpg", width: 70%)
)

= Rust

Программу можно писать на любом

Будем писать на Rust

Устанавка на Linux:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

= Платформы

Rockhip RK3506 - 3xCortex-A7 (ARMv7)

Бывает ARM64, RISC-V

armv7-unknown-linux-gnueabihf

= Подготовка среды разработки

Установка библиотек (Ubuntu):

```bash
sudo apt install gcc-arm-linux-gnueabihf
```

Добавляем таргет для Rust:

```bash
rustup target add armv7-unknown-linux-gnueabihf
```

cross

= Создание проекта

```bash
cargo new luckfox_test; cd luckfox_test
```

Добавляем файл `.cargo/config.toml`:

```toml
[target.armv7-unknown-linux-gnueabihf]
linker = "arm-linux-gnueabihf-gcc"
```

Можно прописать в домашней папке.

= Сборка проекта

```bash
cargo build --target="armv7-unknown-linux-gnueabihf" --release;
```

= Загрузка на одноплатник

```bash
scp luckfox_test root@IP:/root/
```

= Подключаемся к одноплатнику и запускаем

```bash
ssh root@IP

./luckfox_test
```
