#!/usr/bin/env bash

echo "\e[1mBitrix template combine\e[0m
Помогу вам при разработке шаблона для CMS Bitrix. Ознакомьтесь с моими возможностями:
  1. Начать новый проект

  q. Выход
"
read -p "Ваш выбор (1/Q): " USER_ACTION

case $USER_ACTION in
    1 )
        sleep 1
        echo "\e[1mНачало нового проект\e[0m"
        ;;
    [Qq]*|* )
        sleep 1
        echo "\e[1mВыход\e[0m"
        
        sleep 1
        exit 1
        ;;
esac
