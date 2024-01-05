# Топ фильмов
Это мобильное приложение, созданное в рамках выполнения лабораторной работы по курсу "Android Developer" Тинькофф Финтех 2023. 
В приложении реализован список популярных фильмов и их описаний, с использованием неофициального API кинопоиска.

## Основные функции:
— Список популярных фильмов: На главном экране отображается список популярных фильмов.  
— Карточки фильмов: Каждая карточка содержит наименование фильма, постер и год выпуска.  
— Подробная информация: При клике на карточку открывается экран с более подробной информацией о фильме: постер, описание, жанр, страна производства.  
— Возможность работать в условиях недоступности сети: В случае ошибки загрузки, будет показано уведомление об этом.  
## Дополнительные функции:
— Популярное и избранное: Есть разделы "Популярное" и "Избранное". При длительном клике на карточку, фильм добавляется в избранное и сохраняется в БД.  
— Избранные фильмы доступны без подключения к сети.  
— Выделение избранного: При просмотре популярных фильмов, избранные фильмы выделяются.  
— Поиск фильмов: В разделах "Популярное" и "Избранное" доступен поиск фильмов по наименованию.  
— Авторизация с использованием Firebase.  
— Локализация с использованием l10n. При отсутствии названия на одном из языков, используется translit.

## Скриншоты:
### Splash и авторизация:
<img src="https://github.com/B-E-B/movie_list_app/assets/128063667/4f1eb592-923e-4bec-9da5-1b5586f65ed8" width="250">
<img src="https://github.com/B-E-B/movie_list_app/assets/128063667/d79a4a16-75b4-47b3-b51d-9cd14b21b502" width="250">
<img src="https://github.com/B-E-B/movie_list_app/assets/128063667/1d388f93-315c-4a49-b2ce-e022db45a9af" width="250">  

### Разделы "Популярные" и "Избранное" + демонстрация локализации:
<img src="https://github.com/B-E-B/movie_list_app/assets/128063667/e0085ee5-593a-4d2a-8ee8-8cb78520658d" width="250">
<img src="https://github.com/B-E-B/movie_list_app/assets/128063667/b6cd522d-500b-4ab1-9848-9f7e8674dc0e" width="250">
<img src="https://github.com/B-E-B/movie_list_app/assets/128063667/66fa461f-bd1a-4901-9507-89afda30d77d" width="250">


