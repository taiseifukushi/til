# &blockでブロックをProcに変換している
def my_method1(&the_proc)
  the_proc
end

r = my_method1 {|name| "Hello, #{name}"}
p r.class
p r.call("Bill")

# Procをブロックに戻したいとき
def my_method2(greeting)
  "#{greeting}, #{yield}"
end

my_proc3 = proc { "Bill" }
my_proc4 = Proc.new { "EriKo" }
# failed = my_method2("Hello", my_proc3)
# failed = my_method2("Hello", my_proc4)

# 20220826_proc.rb:11:in `my_method2': wrong number of arguments (given 2, expected 1) (ArgumentError)
#         from 20220826_proc.rb:18:in `<main>'

# Procをブロックに戻したいとき
# も&hogeを使う
p my_method2("Hello", &my_proc3)
p my_method2("Hello", &my_proc4)