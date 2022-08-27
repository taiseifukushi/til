# Unbound
# https://docs.ruby-lang.org/ja/latest/method/Method/i/unbind.html
# >self のレシーバとの関連を取り除いた UnboundMethod オブジェクトを生成して返します。

class Foo
  def foo
    "foo"
  end
end

m = Foo.new.method(:foo)
p m
# ➜  04_block git:(main) ✗ be ruby 20220827_Method.rb
# #<Method: Foo#foo() 20220827_Method.rb:6>


module MyModule
  def my_method
    42
  end
end

ub = MyModule.instance_method(:my_method)
p ub.class
p ub
# UnboundMethod
# #<UnboundMethod: MyModule#my_method() 20220827_Method.rb:18>
