# rbenv

https://github.com/rbenv/rbenv


## rbenv shims

rake、rubocop、rspecなどといったRubyのコマンド単位で生成される実行可能なスクリプト

```bash
➜  til git:(main) ✗ ls ~/.rbenv/shims 
bootsnap  erb       irb       pumactl   rackup    rbs       ri        thor
bundle    foreman   nokogiri  racc      rails     rdbg      ruby      typeprof
bundler   gem       puma      racc2y    rake      rdoc      sprockets y2racc
```

### shimsの役割

rbenvはshimsを経由して、gemが提供するrubyの実行ファイルを実行する。
rbenvを使っている場合、gemの実行ファイルは、`~/.rbenv/versions/*/bin/*`に配置される。

rbenvを使っている環境では、`~/.rbenv/shims/`がはじめに呼び出される。
shimsは、**現在のRubyのバージョンを特定し**、**特定したバージョンのRubyの本来の実行可能ファイルを探し呼び出す(`~/.rbenv/versions/*/bin/*`)**

### rbenvを使っている環境でshimsを呼び出すために、$PATHに`/Users/xxx/.rbenv/shims`を追加する。

`rbenv init`を実行することで、$PATHに`/Users/xxx/.rbenv/shims`を追加される。
通常、rubyの環境構築の際に、.bashrcなどに追加されているもの

```bash
$ echo $PATH
/Users/tfukushi/.rbenv/shims:/Users/tfukushi/.rbenv/bin
```

### rbenv rehash

>gemの実行ファイルは、`~/.rbenv/versions/*/bin/*`に配置される。

`~/.rbenv/shims/`を呼び出しても、実行ファイルは`~/.rbenv/versions/*/bin/*`に存在するため、rubyの実行ができない。(`gem install xxx`でgemをインストールした際は、`~/.rbenv/versions/*/bin/`の方にしかインストールされない。)
`rbenv rehash`を実行して、`~/.rbenv/versions/*/bin/`のファイルを`~/.rbenv/shims/`以下にコピーする必要がある。

>Installs shims for all Ruby executables known to rbenv (~/.rbenv/versions/*/bin/*). Typically you do not need to run this command, as it will run automatically after installing gems.





