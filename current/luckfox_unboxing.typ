// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_unboxing.typ --root . current/luckfox_unboxing.pdf

#import "../style/style.typ": style

#show: style.with(
  header: "Luckfox",
  title: "Luckfox - распаковка",
)

= Что не нравится в Raspberry Pi

- Мало интерфейсов
- Жесткая распиновка
- Pi Zero - нет Ethernet, нет USB

#pagebreak()

= Luckfox Lyra Ultra

- Rockchip RK3506B: 3*Cortex-A7 1.5GHz Cortex-M0 200MHz
- 512MB DDR3L
- 8GB eMMC
- Ubuntu Linux / Buildroot
  - перекомпиляция ядра
- 10/100M Ethernet port
- Onboard 2.4GHz WiFi 6 / Bluetooth 5.2 / BLE
- MIPI DSI 2-lane
  - Luckfox
  - Raspberry
  - Waveshare
- 52 пина / 29 × Rockchip Matrix IO pins
  - 6xUART
  - 3xI2C
  - 3xSPI
  - 2xCAN
