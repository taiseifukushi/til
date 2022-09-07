# Iterator
集約オブジェクトに保持された要素に対して、順にアクセスする方法を提供する
javaであれば、`java.util.Iterator`インターフェイスや`java.util.Enumeration`

集約オブジェクトの子オブジェクトをそれぞれ伝えること

## Iteratorパターン

## external iterator vs internal iterator
例えばソートされた配列2つを、別のソートされた配列にマージするとき

Iterator/example_external_iterator.rb

- 内部イテレータ
  - シンプルである
  - 組み込みメソッドが用意されている
- 外部イテレータ
  - イテレータオブジェクトを用意する必要がある


## Iteratorパターンの注意点
### 集約オブジェクトの要素を走査しているときに、集約オブジェクトが変更される場合
- 配列であればインデックスがずれたり、存在しなくなった要素を見に行くかもしれない
- この場合、イテレータのコンストラクタで配列のコピーを作ることで対処する

例
```ruby
class ChangeArrayIterator
  def initialize(array)
    @array = Array.new(array)
    @index = 0
  end
  # ...
end
```

```ruby
# array = []
def change_for_each_element(array)
  copy = Array.new(array)
  i = 0
  while i < copy.length
    yield(copy[i])
    i += 1
  end
end
```

配列のシャローコピーを作る
コピーはオリジナルの内容を参照する

マルチスレッドプログラムでは、あるスレッドが集約オブジェクトを破壊してイテレータを壊さないように注意


### シャローコピー、ディープコピー
https://zenn.dev/luvmini511/articles/722cb85067d4e9

ruby
シャローコピー
dup clone
https://docs.ruby-lang.org/ja/latest/method/Object/i/clone.html

ディープコピー
deep_dup
https://railsguides.jp/active_support_core_extensions.html#deep-dup

