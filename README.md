# Барбекю

![Барбекю](https://raw.githubusercontent.com/ipirojnoe/bbq/main/public/favicon.png)

Барбекю - сервис, где можно позвать друзей без лишних вопросов, долгой координации и man-in-the-middle

- Отправляешь ссылку на мероприятие всем своим друзьям
- Смотришь кто согласился
- Отдыхаешь

## Возможности

- Зарегистрироваться через почту или github
- Создать мероприятие с доступом по пин коду
- Оставить комментарий
- Загрузить фотографию к мероприятию
- Загрузить свою фотографию профиля
- Получать email'ы с новыми участниками и с новыми комментариями своего мероприятия
- Смотреть какие события создал пользователь и на какие пошёл

Событие можно открыть и закрыть в любой момент, поменять пин-код, а также удалить.
Посмотреть как всё работает [можно по этой ссылке](https://bbq.ipirojnoe.ru/)

## Зависимости

В приложении "Барбекю" используются следующие гемы:

- [Ruby on Rails](https://github.com/rails/rails) - Лучший фреймворк
- [Postgres](https://github.com/ged/ruby-pg) - База данных
- [Devise](https://github.com/heartcombo/devise) - Безопасная аутентификация
- [Omniauth](https://github.com/omniauth/omniauth) и [Omniauth-github](https://github.com/omniauth/omniauth-github) - Аутентификация через GitHub
- [Pundit](https://github.com/varvet/pundit) - Простая и понятная авторизация доступа
- [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) и [RMagick](https://github.com/rmagick/rmagick) - Для правильной загрузки и обработки фотографий
- [MailJet](https://github.com/mailjet/mailjet-gem) - Отправка уведомлений пользователям по Email
- [Resque](https://github.com/resque/resque) - Фоновая отправка писем пользователям

```
node v14.21.3
```


## Установка и запуск

**1**.Клонирование репозитория 
```bash
git clone git@github.com:ipirojnoe/bbq.git
cd bbq
```

**2**.Установка гемов

```bash
gem install bundler:2.2.13
bundle install --without production
```

**3**.Установка NodeJS, Yarn и Webpacker

```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn
rails webpacker:install
```

**4**.Затем нужно сделать миграции
```bash
mv config/database.yml.exaample config/database.yml
bundle exec rails db:migrate
```

**5**.Создать файл .env в корне приложения и вставить содержимое
<details>
      <summary>Содержимое</summary>
  
    MAILJET_API_KEY=...
    MAILJET_SECRET_KEY=...
    MAILJET_SENDER=...
    S3_ACCESS_KEY=...
    S3_BUCKET_NAME=...
    S3_SECRET_KEY=...
    SECRET_KEY_BASE=...
    EMAIL_FROM=...
    GITHUB_KEY=...
    GITHUB_SECRET=...
</details>

Вам нужно самим получиться токены у MailJet, Amazon и GitHub

**6**. Запуск приложения

```bash
bundle exec rails s
```

**7**. Для деплоя своих версий, нужно настроить `config/deploy.rb`


## Лицензия

MIT
