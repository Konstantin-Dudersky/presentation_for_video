// typst watch --ignore-system-fonts --font-path ./fonts current/luckfox_sdk_install.typ --root . current/luckfox_sdk_install.pdf

#import "../style/style.typ": style

#show: style.with(
  header: "Luckfox - установка SDK",
  title: "Luckfox Lyra - установка SDK",
)

= Зачем SDK

- настройка устройств
- настройка пакетов прошивки

= Подготовка sdk

Работает только под Ubuntu 22.04

Компилировать можно в виртуалке. Загрузка из виртуалки не идет

- sudo apt-get install ...
- sudo ln -sf /usr/bin/python2 /usr/bin/python
- tar -xzvf luckfox-lyra-241213.tar.gz
- .repo/repo/repo sync -l

= Компиляция прошивки

- ./build.sh lunch
- ./build.sh

= Загрузка в одноплатник

- перевести в режим загрузки
- sudo ./rkflash.sh update
