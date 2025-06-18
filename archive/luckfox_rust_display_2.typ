// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_display_2.typ --root . current/luckfox_rust_display_2.pdf

#import "../style/style.typ": style

#show: style.with(
  header: [Luckfox - дисплей],
  title: [Luckfox Lyra - создаем графику с помощью Slint],
)

= Графические библиотеки

- #link("https://lvgl.io")[LVGL]
- #link("https://slint.dev")[Slint]

= Slint

Бекенды:
- qt
- winit
- #highlight[linuxkms]

Рендеры:
- qt (soft)
- software
- femtovg (OpenGL)
- #highlight[skia] (OpenGL / Vulkan / soft)

= Конфигурация buildroot

- Target packages -> Libraries -> Hardware handling -> libinput
- Target packages -> Libraries -> Hardware handling -> libxkbcommon
- Target packages -> Libraries -> Graphics -> fontconfig

= Создаём проект

```sh
cargo new slint
```

= `Cargo.toml`

```toml
slint = { version = "*", default-features = false, features = [
    "compat-1-2",
    "backend-linuxkms-noseat",
    "renderer-skia",
] }

[build-dependencies]
slint-build = "*"
```

= `main.slint`

```slint
export component MainWindow inherits Window {
    width: 800px;
    height: 480px;
    default-font-size: 20px;

    property <int> counter;

    VerticalLayout {
        alignment: center;
        spacing: 30px;
        width: 200px;

        ...
    }
}
```

#pagebreak()

```slint
Button {
    width: 100%;
    height: 80px;
    text: "Увеличить";
    clicked => {
        counter += 1;
    }
}
```

```slint
Text {
    text: "Счётчик: " + counter;
    horizontal-alignment: center;
}
```

= `build.rs`

```rust
fn main() {
    let config = slint_build
        ::CompilerConfiguration::new()
        .with_style("cupertino-dark".into());
    slint_build
        ::compile_with_config
        ("main.slint", config)
        .unwrap();
}
```

= `main.rs`

```rust
use slint::include_modules;

include_modules!();

fn main() {
    MainWindow::new().unwrap()
        .run().unwrap();
}
```

= Сборка

```bash
cargo build --target="armv7-unknown-linux-gnueabihf" --release; scp target/armv7-unknown-linux-gnueabihf/release/slint root@target:/root/
```

= Сборка с помощью cross

Установка:

```sh
cargo install cross
```

`Cargo.toml`:

```toml
[package.metadata.cross.target.armv7-unknown-linux-gnueabihf]
image = "ghcr.io/slint-ui/slint/armv7-unknown-linux-gnueabihf"
```

Сборка:

```sh
cross build --target="armv7-unknown-linux-gnueabihf" --release; scp target/armv7-unknown-linux-gnueabihf/release/slint root@target:/root/
```

= Использование примеров

```bash
git clone https://github.com/slint-ui/slint.git
```

= Energy monitor

`Cargo.toml`:

```toml
slint = { version = "*", default-features = false, features = [
    "compat-1-2",
    "backend-linuxkms-noseat",
    "renderer-skia",
] }

[package.metadata.cross.target.armv7-unknown-linux-gnueabihf]
image = "ghcr.io/slint-ui/slint/armv7-unknown-linux-gnueabihf"
```

#pagebreak()

Сборка и загрузка:

```bash
cross build --target="armv7-unknown-linux-gnueabihf" --release

scp ../../target/armv7-unknown-linux-gnueabihf/release/energy-monitor root@target:/root
```

= Home automation

`Cargo.toml`:

```toml
slint = { version = "*", default-features = false, features = [
    "compat-1-2",
    "backend-linuxkms-noseat",
    "renderer-skia",
] }

[package.metadata.cross.target.armv7-unknown-linux-gnueabihf]
image = "ghcr.io/slint-ui/slint/armv7-unknown-linux-gnueabihf"
```
#pagebreak()

Сборка и загрузка:

```bash
cross build --target="armv7-unknown-linux-gnueabihf" --release

scp ../../../target/armv7-unknown-linux-gnueabihf/release/home-automation root@target:/root
```
