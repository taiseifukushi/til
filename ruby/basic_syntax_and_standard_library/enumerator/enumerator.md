# Enumerator

https://docs.ruby-lang.org/ja/latest/class/Enumerator.html

https://moneyforward.com/engineers_blog/2020/02/04/ruby-enumerator/
を読む

## イテレータ

>イテレータ（英語: iterator）とは、プログラミング言語において配列やそれに類似する集合的データ構造（コレクションあるいはコンテナ）の各要素に対する繰り返し処理の抽象化である。実際のプログラミング言語では、オブジェクトまたは文法などとして現れる
https://ja.wikipedia.org/wiki/%E3%82%A4%E3%83%86%E3%83%AC%E3%83%BC%E3%82%BF

配列などのコレクションの要素を列挙する仕組み

外部イテレータと内部イテレータがある。

### 外部イテレータ

外部イテレータはコレクションとイテレータが独立している仕組み

```ruby
authors = Enumerator.new do |y|
  y << '村上春樹'
  y << '吉本ばなな'
  y << '小川洋子'
end
# => #<Enumerator: ...>
# コレクションの作成


```

Enumerator::Yielder
>Enumerator.new で使われるクラスで、直接使うものではありません。
https://docs.ruby-lang.org/ja/latest/class/Enumerator=3a=3aYielder.html

直接使うものではありません。

`Enumerator::Yielder#<<`
- 生成された Enumerator オブジェクトの each メソッドを呼ぶと Enumerator::Yielder オブジェクトが渡されたブロックが実行される
- ブロック内の << が呼ばれるたびにeachに渡されたブロックが<<に渡された値とともに繰り返される。


### 内部イテレータ

Ruby
>RubyではEnumerableが、eachなどのイテレートするメソッドを持っている内部イテレータである。eachメソッド呼出しに { ... } という書式で「ブロック」を書くと、その中の手続きが繰返し実行される。

module Enumerable
>このモジュールのメソッドは全て each を用いて定義されているので―

内部イテレータはイテレータがコレクション内部に実装されている仕組み

## Enumeratorの使い時

- 遅延評価
- 複雑なループ構造の抽象化


## 遅延評価

Rubyで遅延評価をするとき`Enumerable#lazy`を使うことができる。
https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/lazy.html

>自身を lazy な Enumerator に変換したものを返します。

```ruby
1..Float::INFINITY
# => 1..Infinity
(1..Float::INFINITY).lazy
# => #<Enumerator::Lazy: ...>

(1..Float::INFINITY).map{|n| n * 2}.first(5)
# 処理が終わらない

(1..Float::INFINITY).lazy.map{|n| n*2}.first(5)
# => [2, 4, 6, 8, 10]
```

## Enumerable#mapとEnumerator::Lazy#map

Enumerable#mapはArrayを返す。
Enumerator::Lazy#mapはEnumerator::Lazyを返す。

## るびま 無限リストを map 可能にする Enumerable#lazy

https://magazine.rubyist.net/articles/0041/0041-200Special-lazy.html

>Enumerable#lazy は「map や select などの lazy 版を提供するためのメソッドである」というのが一般的な説明です。が、「map や select などの lazy 版を提供する__ための名前空間を提供するメソッド__」というのがより正確な説明になります。人に聞かれたらこちらの答え方をすることで、Ruby 上級者として一目置かれることができるでしょう。

- `Enumerable#lazy`はmapやselectメソッドなどのlazy版を、.lazy.mapのような形で提供する
- lazy版map は配列ではなく`Enumerator::Lazy`を返す
- 無限に続く列、巨大な列、終わりの分からない列に対しても、mapやselectなどの操作を可能にする

「名前空間を提供する」とは？
大量のメソッドを追加する代わりに`Enumerator::Lazy`クラスをつくることで、Enumerableのメソッドを上書きできるようにした。

>lazy 版の map メソッドですが、問題となったのはメソッド名でした。Enumerable モジュールには、lazy 版がほしくなるようなメソッドが map、select、reject、drop、… とたくさんあります。これら全てについて「lazy_map」や「lazy_select」などのメソッドを追加していくと、Enumerable モジュールのメソッドが一気に増えてしまいます。

>Enumerable モジュールに lazy というメソッドを追加して、これを呼ぶと Enumerator::Lazy という特殊なクラスのインスタンスを返すようにしました

これによって、`Enumerator::Lazy`は、Enumeratorとほぼ同じだが、mapやselectなどの一部メソッドで、lazy版の動作を行えるように上書きできた。

=> 名前空間を分けた

## Enumerator::Lazyの活用

https://www.slideshare.net/cuzic/enumerable-lazy


ベンチマークをとってみる

`ruby benchmark.rb`

```ruby
# ➜  enumerator git:(main) ✗ ruby benchmark.rb
#                  user     system      total        real
# not use lazy  0.000019   0.000000   0.000019 (  0.000017)
# use lazy     0.000013   0.000000   0.000013 (  0.000013)
```

lazyを使ったほうが早い

## memo
### EnumratorはFiberを活用するデザインパターンの一つ

>EnumratorはFiberを活用するデザインパターンの一つ

??
そもそもFiberがわからなかった。
??

