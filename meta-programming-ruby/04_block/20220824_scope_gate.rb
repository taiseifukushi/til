# scope gate
# プログラムがスコープを切り替えて、新しいスコープをオープンするタイミング
# プログラムがスコープを切り替えるタイミング
# - class
# - module
# - def

# my_var = "変数"
# class MyClass
#   # 1. ここで表示したい
#   def my_method
#     # 2. ここで表示したい
#   end
# end

# 1. に直接my_varを渡すことはできない
# => classキーワードを使わず、メソッド呼び出しで渡す

# これはクラス定義をしてる?何してる?初めてみた
# class キーワード = Class.new ??
# ブロックをClass.newにわたすことで、クラスにインスタンスメソッドを定義できる
my_var = "変数"
MyClass = Class.new do
  # 1. ここで表示したい
  p my_var # 呼び出し成功
  def my_method
    # 2. ここで表示したい
  end
end

# 2. に表示するにはどうするか
# キーワードをメソッド呼び出しに変更する
# def ;endではなく、Module.define_methodが使える

my_var2 = "変数"
MyClass2 = Class.new do
  # 1. ここで表示したい
  p "#{my_var2}: 1" # 呼び出し成功
  # def my_method
  #   # 2. ここで表示したい
  #   p "#{my_var2}: 2"
  # end
  define_method :my_method do
    # 2. ここで表示したい
    p "#{my_var2}: 2"
  end
end
MyClass2.new.my_method

# スコープゲートをメソッド呼び出しに置き換えることで、他のスコープの変数が見えるようになる

# ===
p "==="

# Kernelのprivateメソッドであるdefine_method にアクセスするために動的ディスパッチを使う
# 変数 sharedを共有するために、メソッドで囲んでいる => 共有メソッド
def define_methods
  shared = 0
  Kernel.send :define_method, :counter do
    shared
  end
  
  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods

p counter
p inc(4)
p counter

# ===
# class => Class.new
# module => Module.new
# def => Module.define_method
# に置き換えることができる

# 共有スコープを使って、
# スコープゲートで囲うことで変数を共有できる
