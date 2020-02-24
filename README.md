# marvel_characters_mvvmc

Для работы приложения в папку `MVVMCMarvelCharacters/Configs`
необходимо добавить 2 файла конфигурации `Development.xcconfig` и `Release.xcconfig`.
В каждом файле необходимо добавить 3 переменные:

`BASE_URL = https:/$()/gateway.marvel.com/v1/public` - урл до апи марвела

`PRIVATE_KEY = ` - приватный ключ, выданный на сайте марвела

`PUBLIC_KEY = ` - публичный ключ, выданный на сайте марвела
