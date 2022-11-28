# open api generater

## memo
- open api generator
    - https://github.com/OpenAPITools/openapi-generator-cli
- `npx openapi-generator-cli generate -g ruby-on-rails -i openapi.yaml -o ./rails_codes`
    - で生成できた
- 疑問
    - どこに生成するのが一番いいんだろう
        - 今回は適当なディレクトリに生成した
    - あとからapiの使用変更したいときどうしたらどうしたらいいんだろう
        - yaml変更して、コマンド実行したらいい感じにrailsのコードも上書きしてくれる?
    - そもそもredocって何？
    - rails6, 7は非対応？
        - https://openapi-generator.tech/docs/generators/ruby-on-rails/
        - >Generates a Ruby on Rails (v5) server library.
        - と書いているので5までっぽい
- APIモードで生成されているみたい
- xxx

