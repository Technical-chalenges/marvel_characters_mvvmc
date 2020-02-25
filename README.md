# marvel_characters_mvvmc

Для работы приложения в папке `MVVMCMarvelCharacters/Configs`
в файлах `Development.xcconfig` или `Release.xcconfig` (зависит от сборки дебаг или релиз, можно сразу в обоих) необходимо раскомментировать 2 строчки: 

`PUBLIC_KEY = 00000000000000000000000000000000`

`PRIVATE_KEY = 0000000000000000000000000000000000000000`

Оба ключа можно получить на сайте https://developer.marvel.com/account
# Не забудь подтянуть поды
`pod install`
