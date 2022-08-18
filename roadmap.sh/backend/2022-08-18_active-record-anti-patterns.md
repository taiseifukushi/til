# ActiveRecordデータ処理アンチパターン / active-record-anti-patterns
https://speakerdeck.com/toshimaru/active-record-anti-patterns?slide=25

ソースコード
https://github.com/toshimaru/rdm-rails5.1

## メモ

### All Each Pattern
```ruby
User.all.each do |user|
  if user.created_at >= Date.new(2017)
  user.point += 100 
  user.save 
end
```
Model.allであるテーブルの全レコードを取得したあとに、その結果をeachでループさせる

- 全件取得でメモリが圧迫そもそも全件取得する必要はあるのか
    - そもそも全件取得である必要があるのか？
- 単純にループ回数が増えるのでCPUリソースも消費

#### 解決策
1. User取得件数をフィルター
    - all ➜ where
2. 少しずつUserを取得してメモリフレンドリーな処理に
    - each ➜ find_each

```ruby
User.where("created_at >= ?", Date.new(2017))
    .find_each do |user|
  user.point += 100 
  user.save 
end
```

##### そのほか
###### in_batchesについて
>eachはデータをすべてメモリにのせてからループ処理を実行するため、大量のデータを扱う場合はメモリを圧迫させる可能性があります。
Railsで大量のデータをループ処理する場合、データを割してメモリにのせるin_batches・find_in_batches・find_eachを利用することでメモリ消費が抑えられます。
https://nishinatoshiharu.com/rails-roop-methods-difference/

>n_batchesiは**ActiveRecord::Relation**をブロックに渡すので、ブロック内でwhereによる絞り込みやupdate_allによる一括更新を行いたい時に向いているメソッドです。

>分割してレコードを取得して処理
デフォルトで1000件ずつ処理
https://railsdoc.com/page/in_batches

分割してレコードを取得して処理
```ruby
Person.where("age > 21").in_batches do |relation|
  relation.delete_all
  sleep(10) # Throttle the delete queries
end
```

分割して取得して削除
```ruby
Person.in_batches.delete_all
```

###### find_in_batchesについて
>find_in_batchesはデータを分割して取得し、**Array**の形でブロックへ渡します。デフォルトの分割単位は1,000件です。
find_in_batchesの実装を確認するとメソッドの中でin_batchesを呼んでいることがわかります。
つまり、**in_batchesで渡されたオブジェクトをArrayに変換するメソッドがfind_in_batchesの正体です。**

###### find_eachについて

---
### N+1 Update Queries Pattern

```ruby
User.where("created_at >= ?", Date.new(2017)) # => 1 Select
    .find_each do |user|
  user.point += 100 
  user.save # => N Select
end
```
- 1回 Select + N回 Update のクエリが走る
- Nの数が多くなればなるほどパフォーマンスが悪化
- N+1 Delete Patternも

#### 解決策
1. 複数レコードを一括で更新する
- update => update_all

```ruby
User.where("created_at >= ?", Date.new(2017)).update_all("point = point + 100")
```

### 注意点
- update_allはupdateと違い
    - >Active Recordのコールバックまたはvalidationは無視される
- テーブルロックに注意

---

## Ruby Aggregation Pattern

```ruby
user_like_counts = [] 
User.all.each do |user|
  user_like_counts << {
    name: user.name,
    total_like_count: user.point.sum(&:like_coumt)
  }
end

user_like_counts
  .sort_by! {|u| u[:total_like_count]}
  .reverse!
  .take(100).each do |u| #Enumerable オブジェクトの先頭から n 要素を配列として返します。
    p "#{u[:name]}(#{u[:total_like_count]})"
  end
("created_at >= ?", Date.new(2017)) # => 1 Select
    .find_each do |user|
  user.point += 100 
  user.save # => N Select
end
```

- レコード全取得、Rubyの世界で集計・並び替え
- 既に紹介した下記のアンチパターンを踏んでいる
    - All Each Pattern
- メモリリソースに加え、CPUリソースも無駄に消費

#### 解決策
- 素直にRDBの集約・集計関数を使う
    - [Ruby] sort_by & reverse ➜ [SQL] order
    - [Ruby] take ➜ [SQL] limit
    - [Ruby] posts.sum(&:like_count) ➜ [SQL]
- group(:user_id).select(“SUM(like_count)”)

```ruby
Post.group(:user_id)
  .select("user_id, SUM(like_coumt) AS like_coumt")
  .order("like_coumt DESC")
  .limit(100).each do |post|
    p "#{post.user.name}(#{post.like_coumt})"
  end
```

##### そのほか
ActiveRecord::QueryMethods
https://api.rubyonrails.org/v7.0/classes/ActiveRecord/QueryMethods.html
https://api.rubyonrails.org/v7.0/classes/ActiveRecord/QueryMethods.html#method-i-group

### N+1 Queries Pattern

>`#{post.user.name}`

#### 解決策
- モデルに includes を付与
- ActiveRecordのjoinsとpreloadとincludesと eager_loadの違い
    - https://qiita.com/k0kubun/items/80c5a5494f53bb88dc58#%E3%81%BE%E3%81%A8%E3%82%81

```ruby
Post.includes(:user)
   .group(:user_id)
   .select("user_id, SUM(like_coumt) AS like_coumt")
   .order("like_coumt DESC")
   .limit(100).each do |post|
     p "#{post.user.name}(#{post.like_coumt})"
   end
```

---

### Unnecessary Query Pattern
```ruby
user_ids = 
  Post.includes(:user)
      .group(:user_id)
      .select("user_id, SUM(like_coumt) AS like_coumt")
      .order("like_coumt DESC")
      .limit(3000).map do |post|
          post.user.id
      end
p user_ids
```
>`post.user`

- 本来必要ではないリソースを取得していること
- 無駄なSQL発行・メモリ消費が発生

#### 解決策
- 不必要な参照を削除
- post.user.id => post.user_id

```ruby
user_ids = 
  Post.includes(:user)
      .group(:user_id)
      .select("user_id, SUM(like_coumt) AS like_coumt")
      .order("like_coumt DESC")
      .limit(3000).map do |post|
          post.user_id
      end
p user_ids
```
or
```ruby
user_ids = 
  Post.includes(:user)
      .group(:user_id)
      .select("user_id, SUM(like_coumt) AS like_coumt")
      .order("like_coumt DESC")
      .limit(3000).map(&:user_id)
p user_ids
```

---
### Unnecessary Model Init Pattern
- 不必要なActiveRecordモデルの生成が発生
- ActiveRecordのモデル生成コストは極めて高い
- ARモデルを生成しなくて済むのであれば、それに越したことはない

#### 解決策
- ActiveRecordモデルを生成を迂回できるメソッドを使用
    - select => pluck

```ruby
user_ids = 
  Post.includes(:user)
      .group(:user_id)
      .select("user_id, SUM(like_coumt) AS like_coumt")
      .order("like_coumt DESC")
      .limit(3000)
      .pluck(:user_id)
p user_ids
```

---
メモ
SQLアンチパターン
https://qiita.com/taiteam/items/33aebded2842808e0391
