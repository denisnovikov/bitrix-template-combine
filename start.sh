#!/usr/bin/env bash

# Скрипт для автоматизации рутинных действий при создании шаблона для CMS Bitrix.
# Автор: Denis Novikov [https://github.com/denisnovikov] - dnovikov1808@gmail.com

# Приветствие пользователя и вывод основной информации по работе с скриптом

echo -n "\nCOMBINE BITRIX
=======================================================================================================================
Доброго времени суток! Я скрипт для автоматизации рутинных действий при создании шаблона для CMS Bitrix. В последнее
время стало много работы по данной CMS и постоянно выполнять одинаковые действия для каждого шаблона - затруднительно.

С помощью данного скрипта можно настроить папку проекта без каких-либо проблем и с минимальными затратами времени.
Приступим.
=======================================================================================================================
Что вы хотите сделать с репозиторием?

1. Выполнить первичную настройку проекта;
2. Очистить проект;

Ваш выбор: "
read PROJECT_ACTION

if [ $PROJECT_ACTION = '1' ]; then
    echo -n "Выберите используемый пакетный менеджер\n\n1. Yarn\n2. NPM\n\nВаш выбор: "
    read PACKAGE_MANAGER

    echo -n "\nВведите ссылку на репозиторий шаблона: "
    read GIT_REPO_LINK

    # Клонируем репозиторий в отдельную папку
    echo "\nЗапуск клонирования репозитория..."
    sleep 2
    git clone ${GIT_REPO_LINK} ./build/
    sleep 2

    cd ./build/
    if [ $PACKAGE_MANAGER = '1' ]; then
        yarn
    elif [ $PACKAGE_MANAGER = '2' ]; then
        npm i .
    else
        npm i .
    fi
    cd ../

    # Задаем вопрос пользователю, есть ли дополнительные репозитории для работы с проектом
    echo -n "\nЕсть ли статическая версия проекта, которую вы хотите подключить? [y/n] "
    read GIT_REPO_STATIC_TITLE

    if [ $GIT_REPO_STATIC_TITLE = "y" ]; then
        echo -n "Введите ссылку на репозиторий статического шаблона: "
        read GIT_REPO_STATIC_VALUE
        sleep 2

        echo "\nЗапуск клонирования репозитория..."
        sleep 2
        git clone ${GIT_REPO_STATIC_VALUE} ./static/
        sleep 2

        cd ./static/
        if [ $PACKAGE_MANAGER = '1' ]; then
            yarn
        elif [ $PACKAGE_MANAGER = '2' ]; then
            npm i .
        else
            npm i .
        fi
        cd ../
    else
        sleep 1
    fi

    echo -n "\nЕсть ли статический шаблон проекта, который вы хотите подключить? [y/n] "
    read GIT_REPO_TEMPLATE_TITLE

    if [ $GIT_REPO_TEMPLATE_TITLE = "y" ]; then
        echo -n "Введите ссылку на репозиторий статического шаблона: "
        read GIT_REPO_TEMPLATE_VALUE
        sleep 2

        echo "\nЗапуск клонирования репозитория..."
        sleep 2
        git clone ${GIT_REPO_TEMPLATE_VALUE} ./sources/
        sleep 2
        echo "\nУстанавливаем зависимости..."

        cd ./sources/
        if [ $PACKAGE_MANAGER = '1' ]; then
            yarn
        elif [ $PACKAGE_MANAGER = '2' ]; then
            npm i .
        else
            npm i .
        fi
        cd ../
    else
        sleep 1
    fi

elif [ $PROJECT_ACTION = '2' ]; then
    echo "Очищаем проект..."
    sleep 2
    rm -rf ./node_modules/
    rm -rf ./build/
    rm -rf ./static/
    rm -rf ./sources/
    sleep 2
    echo "Готово!"
else
    echo "Ошибка выбора..."
fi
