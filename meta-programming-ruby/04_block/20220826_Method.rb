class MyClass
  def initialize(value)
    @x = value
  end

  def my_method
    @x
  end
end

obj = MyClass.new(1)
# https://docs.ruby-lang.org/ja/latest/method/Object/i/method.html
# Object#methodを呼び出すと、メソッドそのものをMethodオブジェクトとして、取得できる
# https://docs.ruby-lang.org/ja/latest/class/Method.html
# >Object#method によりオブジェクト化されたメソッドオブジェクトのクラスです。
# Method#callを使って、実行できる
m = obj.method(:my_method)
p m.call

# lambdaとの違い
# lambdaは定義されたスコープで評価されるが、
# Methodは所属するオブジェクトのスコープで評価される


# Unboundはもとのクラスやメソッドから引き離されたメソッド
module MyModule
  def my_method
    40
  end
end

# Method#instance_methodを呼び出すことで、直接UnboundMethodを取得できる
ub = MyModule.instance_method(:my_method)
p ub.class # => UnboundMethod