# Understanding and fixing N+1 query
https://medium.com/doctolib/understanding-and-fixing-n-1-query-30623109fe89

## メモ
>N+1 クエリとは
TL;DR: N+1 クエリの問題は、コードが N 個の追加のクエリ ステートメントを実行して、プライマリ クエリの実行時に取得できたはずのデータと同じデータをフェッチするときに発生します。

>例として、冷蔵庫とパントリーがキッチンではなく屋根裏にあり、冷蔵庫から何かを取り出したいときはいつでも階段を上らなければならないと想像してみましょう.
さて、寝室に行って料理本を手に取り、チョコレート ケーキのレシピを見つけ、それを持ってキッチンに戻ったとしましょう。

>200 グラムのダーク チョコレート。
屋根裏部屋に行ってチョコレートのタブレットを取りに行き、キッチンに戻って 2 行目を読みます。
卵3個
もう一度、階段を上って 3 つの卵を取りに行き、キッチンに戻ってレシピの次の行を読みます。

屋根裏部屋に取りに行って、キッチンに戻る
屋根裏部屋に取りに行って、キッチンに戻る
の繰り返し

### N + 1 発生時
```ruby
class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all
  end
end
```

```ruby
<% @recipes.each do |recipe| %>
  <article>
    <h2><%= recipe.title %></h2>
    <ul>
	    <% recipe.ingredients.each do |ingredient| %>
	      <li><%= ingredient.name %> <small>(<%= ingredient.quantity %>)</small></li>
	    <% end %>
    </ul>
  </article>
<% end %>
```

このとき発行するクエリは合計5つ
>4 つのレシピがあり、アプリケーションは合計 5 つの SQL リクエストを実行します。
>- 表示する 4 つのレシピを取得するための 1 つ (それがあなたの「1」です)
>- 材料を取得するためのレシピごとの追加クエリ (これが「N」です)

### 修正
>実生活でも Web 開発でも、解決策はほとんど同じです。関連する要素を一括で取得します。
>調理を開始する前にパントリーで必要なものをすべて 1 回のバッチでフェッチするため、**コードは必要に応じて従属モデルをプリロードする必要があります。**

```ruby
class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all.includes(:ingredients)
  end
end
```

`.includes(:ingredients)`を使って、一度に読み込む

>Rails では、Web アプリケーションにデータをプリロードする方法がいくつかあります。
- 「includes」メソッドを使用します (例はこちらから入手できます)。
    - https://www.rubydoc.info/docs/rails/ActiveRecord/QueryMethods#includes-instance_method
    - https://github.com/bankair/sandbox-n-plus-one/pull/1
- 「eager_load」メソッドを使用します。
    - https://www.rubydoc.info/docs/rails/ActiveRecord/QueryMethods#eager_load-instance_method
- 「プリロード」方式の使用
    - https://www.rubydoc.info/docs/rails/ActiveRecord/QueryMethods#preload-instance_method
- ActiveRecord のPreloader クラスを明示的に使用します (トリッキーですが、既に読み込まれているモデルに追加のレコードをアタッチできるため、非常に強力です)。（例はこちらから入手できます）。
    - https://www.rubydoc.info/docs/rails/ActiveRecord/Associations/Preloader
    - https://github.com/bankair/sandbox-n-plus-one/pull/2

Bullet
https://github.com/flyerhzm/bullet
rubyアプリケーションのN+1 クエリを監視するgemがあるらしい

---

# ActiveRecordのjoinsとpreloadとincludesとeager_loadの違い
https://www.bigbinary.com/blog/preload-vs-eager-load-vs-joins-vs-includes
https://qiita.com/k0kubun/items/80c5a5494f53bb88dc58

ActiveRecordでN+1クエリを潰すためにeager loadingを行う場合に使うメソッド
- joins
- eager_load
- preload
- includes

それぞれの違い
キーワード
rails sql キャッシュ join
