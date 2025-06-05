// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_rust_display_1.typ --root . current/luckfox_rust_display_1.pdf

#import "../style/style.typ": style

#show: style.with(
  header: [Luckfox - дисплей],
  title: [Luckfox Lyra - подключение и проверка дисплея],
)

= Конфигурация прошивки

= Инфо об экране

```sh
cat /sys/kernel/debug/dri/0/summary
```

= Тестирование отображения

```sh
modetest -M rockchip -s 74@71:800x480 -Fsmpte
modetest -M rockchip -s 74@71:800x480 -Ftiles
modetest -M rockchip -s 74@71:800x480 -Fplain
modetest -M rockchip -s 74@71:800x480 -Fgradient
```

= Тестирование touch

```sh
evtest
```

= Управление яркостью подсветки

```bash
echo 255 | tee /sys/class/backlight/*/brightness
echo 0 | tee /sys/class/backlight/*/brightness
```
