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
  end
end

class D < C; end
d = D.new
p d.m1
p C.instance_method(false)
