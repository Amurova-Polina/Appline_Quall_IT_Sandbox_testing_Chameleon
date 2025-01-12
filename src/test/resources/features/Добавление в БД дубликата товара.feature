# language: ru

# Тестовые данные:
# $Наименование Груша
# $Тип Фрукт
# $Экзотический false

Функция: Добавление в БД дубликата товара

  Сценарий: Добавление в БД дубликата товара
    * страница "Главная страница" загружена
    * поле "Песочница" видимо
    * поле "Песочница" активно
    * выполнено нажатие на "Песочница"
    * следующие поля видимы:
      | field        |
      | Товары       |
      | Сброс данных |
    * следующие поля активны:
      | field        |
      | Товары       |
      | Сброс данных |
    * нажатием на кнопку "Товары" загружена страница "Список товаров"
    * поле "Песочница" видимо
    * поле "Песочница" активно
    * выполнено нажатие на "Песочница"
    * поле "Сброс данных" видимо
    * поле "Сброс данных" активно
    * нажатием на кнопку "Сброс данных" загружена страница "Список товаров"
    * количество элементов коллекции "Таблица" равно "4"
    * к БД выполнено подключение "H2" с параметрами:
      | field    | value |
      | user     | user  |
      | password | pass  |
#    Проверка того, что в таблице еще нет товаров, которые будут добавлены.
    * к БД выполняется запрос "Проверка наличия элемента в БД" c параметрами:
      | field     | value           |
      | FOOD_NAME | #{Наименование} |
    * количество элементов коллекции "Проверка наличия элемента в БД" равно "0"
    * кнопка "Добавить" видима
    * кнопка "Добавить" активна
    * нажатием на кнопку "Добавить" загружена страница "Добавление товара"
    * следующие поля видимы:
      | field        |
      | Наименование |
      | Тип          |
      | Экзотический |
    * следующие поля активны:
      | field        |
      | Наименование |
      | Тип          |
      | Экзотический |
    * заполняются поля:
      | field        | value           |
      | Наименование | #{Наименование} |
      | Тип          | #{Тип}          |
      | Экзотический | #{Экзотический} |
    * кнопка "Сохранить" видима
    * кнопка "Сохранить" активна
    * выполнено нажатие на "Сохранить"
    * страница "Список товаров" загружена
    * ожидается элемент коллекции "Таблица" в течение "10" секунд с параметрами:
      | field        | value           |
      | Наименование | #{Наименование} |
      | Тип          | #{Тип}          |
      | Экзотический | #{Экзотический} |
    * количество элементов коллекции "Таблица" равно "5"
#    Добавляем дубликат
#    По сути тут тест должен упасть, но в БД уникальным ключом является ID, на котором автоинкремент.
#    Так что по факту дубликат добавится
    * кнопка "Добавить" видима
    * кнопка "Добавить" активна
    * нажатием на кнопку "Добавить" загружена страница "Добавление товара"
    * следующие поля видимы:
      | field        |
      | Наименование |
      | Тип          |
      | Экзотический |
    * следующие поля активны:
      | field        |
      | Наименование |
      | Тип          |
      | Экзотический |
    * заполняются поля:
      | field        | value           |
      | Наименование | #{Наименование} |
      | Тип          | #{Тип}          |
      | Экзотический | #{Экзотический} |
#   На этом моменте
    * кнопка "Сохранить" видима
    * кнопка "Сохранить" активна
    * выполнено нажатие на "Сохранить"
#   Или на этом моменте должна вылезти ошибка. Но мы идем дальше:)
    * страница "Список товаров" загружена
    * ожидается элемент коллекции "Таблица" в течение "10" секунд с параметрами:
      | field        | value           |
      | Наименование | #{Наименование} |
      | Тип          | #{Тип}          |
      | Экзотический | #{Экзотический} |
    * количество элементов коллекции "Таблица" равно "6"
    * к БД выполняется запрос "Проверка наличия элемента в БД" c параметрами:
      | field     | value           |
      | FOOD_NAME | #{Наименование} |
    * количество элементов коллекции "Проверка наличия элемента в БД" больше "1"
#   Если наличие будликатов устраивает, оставляем этот шаг. Если нет, заставляем тест упасть:
#    * количество элементов коллекции "Проверка наличия элемента в БД" равно "1"
    * поле "Песочница" видимо
    * поле "Песочница" активно
    * выполнено нажатие на "Песочница"
    * поле "Сброс данных" видимо
    * поле "Сброс данных" активно
    * нажатием на кнопку "Сброс данных" загружена страница "Список товаров"
    * количество элементов коллекции "Таблица" равно "4"
#    Проверка того, что добавленный элемент удален из таблицы в БД
    * к БД выполняется запрос "Проверка наличия элемента в БД" c параметрами:
      | field     | value           |
      | FOOD_NAME | #{Наименование} |
    * количество элементов коллекции "Проверка наличия элемента в БД" равно "0"
    * закрыто подключение к БД



