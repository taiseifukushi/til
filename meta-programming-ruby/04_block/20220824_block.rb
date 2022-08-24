# Block

def my_method
  x = 'Good Bye'
  yield('world')
end

x = 'Hello'
result = my_method { |y| "#{x}: #{y}" }
# my_method {|y| "#{x}: #{y}"}
# x => "Hello"
# メソッドにある変数のxではなく、ブロックが定義されたときのxを見ている
# y => "world"
p result

# ブロックはクロージャ
# =====
p "====="

def just_yield
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
  local_to_block = 1
end

p top_level_variable
# p local_to_block # => undefined local variable or method `local_to_block' for main:Object (NameError)

# ブロックの中で定義した変数は、ブロックが終了した時点で消える
# =====
p "====="

# https://docs.ruby-lang.org/ja/latest/method/Kernel/m/local_variables.html
# Kernel.#local_variables
# 現在のスコープで定義されているローカル変数名の配列を返します。

v1 = 1
class MyClass
  v2 = 2
  # MyClassの中に入ると、v1はスコープを離れてみえなくなる
  p "no1: #{local_variables}"
  def my_method
    v3  = 3
    p "no2: #{local_variables}"
  end
  p "no3: #{local_variables}"
end

myclass = MyClass.new
p myclass.my_method
p "no4: #{local_variables}"