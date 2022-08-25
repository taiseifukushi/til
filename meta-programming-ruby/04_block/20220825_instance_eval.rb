# https://docs.ruby-lang.org/ja/latest/method/BasicObject/i/instance_eval.html

# instance_eval
# - オブジェクトの特異クラスにインスタンスメソッドを定義する
# - そのオブジェクト自身が参照できるインスタンス変数を定義、または上書きしたりする

class ClassName
  def initialize
    @v = 1
  end
end

obj = ClassName.new
obj.instance_eval do
  p self
  p @v
  @v = 7 # selfが参照できるインスタンス変数を上書き
  @y = 5 # ClassNameの特異クラスにインスタンス変数を定義
  p @v
  p @y
  def out_put
    p @v + @y
  end
end

p obj.out_put