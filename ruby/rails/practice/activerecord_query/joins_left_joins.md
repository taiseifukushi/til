# activerecord_query

## 内部結合、外部結合

Rails における内部結合、外部結合まとめ

https://qiita.com/yuyasat/items/c2ad37b5a24a58ee3d30#参考
https://pikawaka.com/rails/joins
https://pikawaka.com/rails/left_joins#%E5%B7%A6%E5%A4%96%E9%83%A8%E7%B5%90%E5%90%88%E3%81%AE%E7%89%B9%E5%BE%B4

データ用意

activerecord_query/seeds.rb.example

### 内部結合

`joins`

https://railsdoc.com/page/joins
複数のテーブルを結合して取得
https://github.com/rails/rails/blob/984c3ef2775781d47efa9f541ce570daa2434a80/activerecord/lib/active_record/relation/query_methods.rb#L565

内部結合して取得する。

テーブル結合とは
結合条件にしたがって複数のテーブルを一つのテーブルとして結合させること

内部結合(INNER JOIN)や外部結合がある。

joinsメソッド = 内部結合

内部結合とは
= 両方のテーブルで結合条件に合うレコードのみ取得

```sql
SELECT カラム名 FROM テーブル名
  INNER JOIN 結合するテーブル名 
    ON 結合条件
```

>ON句の結合条件が両テーブルにマッチしたレコードのみを取得して１つのテーブルが作成されます


下の例だと、
**moviesテーブルのactor_idとactorsテーブルのidがマッチしているレコードのみ**を取得する。

内部結合の場合は、結合条件にマッチしないレコードは削除されて１つのテーブルを構成する。

`Actor.joins(:movies).to_sql`

```sql
"SELECT \"actors\".* FROM \"actors\" INNER JOIN \"movies\" ON \"movies\".\"actor_id\" = \"actors\".\"id\""  
```

```ruby
[#<Actor:0x0000ffffb4a14ca8                         
  id: 2,                                            
  name: "佐津川愛美",
  created_at: Sun, 20 Nov 2022 02:53:26.703866000 UTC +00:00,
  updated_at: Sun, 20 Nov 2022 02:53:26.703866000 UTC +00:00>,
 #<Actor:0x0000ffffb4a14be0
  id: 1,
  name: "多部未華子",
  created_at: Sun, 20 Nov 2022 02:53:26.669642000 UTC +00:00,
  updated_at: Sun, 20 Nov 2022 02:53:26.669642000 UTC +00:00>,
 #<Actor:0x0000ffffb4a14b18
  id: 4,
  name: "堀北真希",
  created_at: Sun, 20 Nov 2022 02:53:26.720796000 UTC +00:00,
  updated_at: Sun, 20 Nov 2022 02:53:26.720796000 UTC +00:00>,
 #<Actor:0x0000ffffb4a14a50
  id: 2,
  name: "佐津川愛美",
  created_at: Sun, 20 Nov 2022 02:53:26.703866000 UTC +00:00,
  updated_at: Sun, 20 Nov 2022 02:53:26.703866000 UTC +00:00>,
 #<Actor:0x0000ffffb4a14988
  id: 2,
  name: "佐津川愛美",
  created_at: Sun, 20 Nov 2022 02:53:26.703866000 UTC +00:00,
  updated_at: Sun, 20 Nov 2022 02:53:26.703866000 UTC +00:00>,
 #<Actor:0x0000ffffb4a148c0
  id: 4,
  name: "堀北真希",
  created_at: Sun, 20 Nov 2022 02:53:26.720796000 UTC +00:00,
  updated_at: Sun, 20 Nov 2022 02:53:26.720796000 UTC +00:00>,
 #<Actor:0x0000ffffb4a147f8
  id: 5,
  name: "吉高由里子",
  created_at: Sun, 20 Nov 2022 02:53:26.727644000 UTC +00:00,
  updated_at: Sun, 20 Nov 2022 02:53:26.727644000 UTC +00:00>]
```

```ruby
irb(main):031:0> Actor.joins(:movies).count
  Actor Count (4.9ms)  SELECT COUNT(*) FROM "actors" INNER JOIN "movies" ON "movies"."actor_id" = "actors"."id" 
=> 7 
```

### 外部結合

片方のテーブルにレコードがない状態でも１つのテーブルとして結合される

#### 左外部結合

`left_outer_joins`

関連するモデルの左外部結合を行う
https://railsdoc.com/page/left_outer_joins

`left_joins`は`left_outer_joins`のエイリアス
https://github.com/rails/rails/blob/984c3ef2775781d47efa9f541ce570daa2434a80/activerecord/lib/active_record/relation/query_methods.rb#L584

actorsテーブルを指定して`left_joins`メソッドを使うと、
テーブルを結合して、左側のactorsテーブルのデータを取得します。

左側のテーブルを基準に結合することを左外部結合という

左側のテーブル = 結合元のテーブル

```ruby
irb(main):039:0> Actor.left_joins(:movies).to_sql
=> "SELECT \"actors\".* FROM \"actors\" LEFT OUTER JOIN \"movies\" ON \"movies\".\"actor_id\" = \"actors\".\"id\""  
```

```ruby
irb(main):032:0> Actor.left_joins(:movies).count
  Actor Count (6.7ms)  SELECT COUNT(*) FROM "actors" LEFT OUTER JOIN "movies" ON "movies"."actor_id" = "actors"."id"                                                   
=> 9   
```

左外部結合は、条件に一致したレコードに加えて左のテーブルにしかないデータも結合する

いつ使うの？
今回の場合だと、取得したデータから映画に出ている人とそうでない人で処理を分けたい場合に使う。

- 内部結合
  - 結合条件に一致するレコードのみを結合する
- 左外部結合
  - 結合条件に一致するレコードに加えて、基準となる左側のテーブルにしかないデータも結合する


### joinメソッドのネスト


---


## [Rails: JOINすべきかどうか、それが問題だ — #includesの振舞いを理解する（翻訳）](https://techracho.bpsinc.jp/hachi8833/2021_09_22/45650)

読んでみる

https://qiita.com/kurokawa516/items/5ffcfebed09e0d49bf43

>Active Recordでの開発について、N+1クエリ問題を回避するための3つのメソッドとそれぞれの戦略を詳しく見ていきます。3つのメソッドとは、#preload、#eager_load、#includesです。

### N+1を発生させてみる

```ruby
movies = Movie.all
actor_names = movies.map { |movie| movie.actor.name }

  # Movie Load (3.2ms)  SELECT "movies".* FROM "movies"
  # Actor Load (2.5ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
  # Actor Load (1.9ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
  # Actor Load (1.7ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]
  # Actor Load (1.3ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
  # Actor Load (1.7ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
  # Actor Load (0.9ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]
  # Actor Load (0.7ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]
```

### preload

引数のプリロードを可能にする
https://railsdoc.com/page/preload

>問題を解決する方法のひとつは、クエリを2つに分けることです。1つめのクエリは関連データを取得するクエリ、2つ目のクエリは最終的な結果を取得するクエリという具合です。

```ruby
movies = Movie.all
# actor_names = movies.map { |movie| movie.actor.name }
actor_names = movies.preload(:actor).map { |movie| movie.actor.name }

# Movie Load (2.9ms)  SELECT "movies".* FROM "movies"
#   Actor Load (4.8ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" IN ($1, $2, $3, $4)  [["id", 2], ["id", 1], ["id", 4], ["id", 5]]
```

#preload（この名前がそもそもヒントです）は、
別のクエリで関連付けを事前に読み込んでないと、読み込みやフェッチができない。
クエリでactor.nameを使いたければ、
2つのテーブルをJOINする必要がある。

```ruby
movies.preload(:actor).where('actors.id = 1')

#   Movie Load (2.5ms)  SELECT "movies".* FROM "movies" WHERE (actors.id = 1)
# (Object doesn't support #inspect)
# => 
```
actorテーブルは参照できない

### join

preloadの問題はクエリ内で別のテーブルにあるカラムにアクセスできないこと
その理由は、#preloadが常にクエリを分割してしまうためです。


#eager_load
```ruby
actor_names = movies.eager_load(:actor).map { |movie| movie.actor.name }

  # SQL (5.9ms)  SELECT "movies"."id" AS t0_r0, "movies"."actor_id" AS t0_r1, "movies"."title" AS t0_r2, "movies"."year" AS t0_r3, "movies"."created_at" AS t0_r4, "movies"."updated_at" AS t0_r5, "actors"."id" AS t1_r0, "actors"."name" AS t1_r1, "actors"."created_at" AS t1_r2, "actors"."updated_at" AS t1_r3 FROM "movies" LEFT OUTER JOIN "actors" ON "actors"."id" = "movies"."actor_id"
```

#eager_loadを使うと、LEFT JOINを使って1つのクエリだけで関連するレコードをすべて取り出します
Active Recordは2つのテーブルをメモリ上に読み込むことで、クエリ内で別のテーブルにあるカラムにアクセスすることができる。

```ruby
irb(main):209:0> movies.eager_load(:actor).where('actors.id = 1')
  SQL (4.9ms)  SELECT "movies"."id" AS t0_r0, "movies"."actor_id" AS t0_r1, "movies"."title" AS t0_r2, "movies"."year" AS t0_r3, "movies"."created_at" AS t0_r4, "movies"."updated_at" AS t0_r5, "actors"."id" AS t1_r0, "actors"."name" AS t1_r1, "actors"."created_at" AS t1_r2, "actors"."updated_at" AS t1_r3 FROM "movies" LEFT OUTER JOIN "actors" ON "actors"."id" = "movies"."actor_id" WHERE (actors.id = 1)
# =>                                             
# [#<Movie:0x0000ffff89b55a98                    
#   id: 2,                                       
#   actor_id: 1,                                 
#   title: "夜のピクニック",                     
#   year: 2006,                                  
#   created_at: Sun, 20 Nov 2022 02:53:46.973317000 UTC +00:00,
#   updated_at: Sun, 20 Nov 2022 02:53:46.973317000 UTC +00:00>]

irb(main):200:0> movies.eager_load(:actor).where('actors.id = 1').map { |movie| movi
e.actor.name }
#   SQL (4.7ms)  SELECT "movies"."id" AS t0_r0, "movies"."actor_id" AS t0_r1, "movies"."title" AS t0_r2, "movies"."year" AS t0_r3, "movies"."created_at" AS t0_r4, "movies"."updated_at" AS t0_r5, "actors"."id" AS t1_r0, "actors"."name" AS t1_r1, "actors"."created_at" AS t1_r2, "actors"."updated_at" AS t1_r3 FROM "movies" LEFT OUTER JOIN "actors" ON "actors"."id" = "movies"."actor_id" WHERE (actors.id = 1)
# => ["多部未華子"]
```

#joinsの目的
- #joinsではLEFT OUTER JOINではなくINNER JOINが使われる。
- 目的が異なる: 関連付けとともにレコードを読み込むのではなく、クエリの結果をフィルタするために使われる。関連付けのeager loadingを行わないので、N+1クエリを防げません。
- 関連付けられたテーブルのフィールドにアクセスせずにクエリをフィルタしたい場合には問題なく利用できる。ずばりその理由は、#joinsは単に結果をフィルタするだけであり、関連付けられたテーブルを読み込んだり展開したりしないからです。

目的が異なるので、
#joinsは#preloadや#eager_load、#includesと併用できる。

どれにするかを決めないといけない
- LEFT JOINで1つのクエリだけを生成する#eager_loadか
- 先ほどのようにクエリを分割してから関連付けられたデータをフェッチする#preloadか


### includes

関連するテーブルをまとめて取得
https://railsdoc.com/page/includes

>前述のとおり、Rails 4以前の#includesは、それぞれの場合にどちらのeager loading戦略を選択するかという責務を委譲するのに使われていました。#includesは基本的にWHEREやORDERの条件を監視して、関連付けられたテーブルへの参照があるかどうかを監視し、参照がある場合は#eager_loadを（前述のとおり明らかにテーブルのJOINが必要です）、参照がない場合は単に#preloadを使います。次の例をご覧ください。

rails4以前と5以降では違う？

#includesは基本的にWHEREやORDERの条件を監視して、関連付けられたテーブルへの参照があるかどうかを監視する。
参照がある場合は#eager_loadを使う。
ない場合は、#preloadを使う。


```ruby
movies.includes(:actor)

irb(main):159:0> movies.includes(:actor)
  # Movie Load (12.5ms)  SELECT "movies".* FROM "movies"
  # Actor Load (3.9ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" IN ($1, $2, $3, $4)  [["id", 2], ["id", 1], ["id", 4], ["id", 5]]

irb(main):166:0> movies.includes(:actor).to_sql
# => "SELECT \"movies\".* FROM \"movies\""
```


```ruby
movies.includes(:actor).where('actors.id = 1')
```

>関連付けられたテーブルを#includesでJOINしたい場合は、たとえば次のように#referencesメソッドで関連テーブルを明示する必要があり
>#includesを呼ばないと#referencesは呼び出せませんし、#referencesなしで#includesを呼ぶと常にpreload戦略が選択されてしまいます。

https://qiita.com/k0kubun/items/80c5a5494f53bb88dc58

- preload
  - そのテーブルとのJOINを禁止したいケース
- includes
  - JOINしても問題なくてとりあえずeager loadingしたい場合
- eager_load
  - 必ずJOINしたい場合
