c = class MyClass
  self
end

p c
# ➜  05_class git:(main) ✗ be ruby 20220827_class.rb 
# MyClass

p c.new
# <MyClass:0x0000000100ec44a0>

p c.new.class
# MyClass

# Rubyのプログラムは常にカレントオブジェクトselfを持っている
# と同時に常にカレントクラス もしくは カレントモジュールをもっている
# カレントオブジェクトはselfで参照できる

class C
  def m1
    def m2;end
  end
end

class D < C; end
d = D.new
p d.m1
p C.instance_methods(false)
# ➜  05_class git:(main) ✗ be ruby 20220827_class.rb
# :m2
# [:m1, :m2]

# https://docs.ruby-lang.org/ja/latest/method/Module/i/class_eval.html
# class_eval
# Module#class_evalで、そのクラスにインスタンスメソッドや特異クラスメソッドを追加する
def add_method_to(a_class)
  a_class.class_eval do
    def m1
      "add m1 method with class_eval"
    end
  end
end

add_method_to(String)
p "teststring".m1
# => "add m1 method with class_eval"
p String.instance_methods
# [..., :m1, ..., ...]
p String.new.m1
# => "add m1 method with class_eval"
# クラスメソッドを追加したはずだけど、インスタンスメソッドが追加されている？
# ???

# 表現がわからない
# >オブジェクトをオープンする
# >クラス定義をオープンする
# ???
# このオブジェクトをオープンしたいが、クラスのことは気にしたい => instance_eval
# ここでオープンクラスを使いたい => class_eval
