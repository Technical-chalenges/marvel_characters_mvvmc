# marvel_characters_mvvmc

Для работы приложения в папке `MVVMCMarvelCharacters/Configs`
в файлах `Development.xcconfig` или `Release.xcconfig` (зависит от сборки дебаг или релиз, можно сразу в обоих) необходимо раскомментировать: 

`PUBLIC_KEY = 00000000000000000000000000000000` - публичный ключ и 

`PRIVATE_KEY = 0000000000000000000000000000000000000000` - приватный ключ

Оба ключа можно получить на сайте https://developer.marvel.com/account
# Не забудь подтянуть поды
`pod install`
