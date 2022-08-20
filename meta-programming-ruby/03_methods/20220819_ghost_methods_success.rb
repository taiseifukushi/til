# 解決策
# - 必要もないのにゴーストメソッドを導入しないこと
# - Rouletteで受け付けるメンバーの名前を制限すること
#   - 扱えない呼び出しがあったときは、受け付けないようにする

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    # ["Bob", "Frank", "Bill"]以外で呼び出されたとき、期待通りBasicObjectのmethod_missingを呼ぶ
    super unless ["Bob", "Frank", "Bill"].include? person
    # ブロックの外で定義することで
    # `"#{person} got a #{number}"`でnumberを呼んでもローカル変数として呼びだせる
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end

  def test_instance_methods
    # p instance_methods
  end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank

# 設定している名前で呼ぶ
# 03_methods git:(main) ✗ ruby 20220819_ghost_methods_success.rb
# 10...
# 6...
# 4...
# Bob got a 4
# 9...
# 9...
# 2...
# Frank got a 2

# 設定していない名前で呼ぶ
# puts number_of.ann
# ➜  03_methods git:(main) ✗ ruby 20220819_ghost_methods_success.rb >> result_success.txt
# 20220819_ghost_methods_success.rb:9:in `method_missing': undefined method `ann' for #<Roulette:0x000000010264de78> (NoMethodError)


# Module#instance_methodsを見てみる
# https://docs.ruby-lang.org/ja/latest/method/Module/i/instance_methods.html
# そのモジュールで定義されている public および protected メソッド名の一覧を配列で返します。
# false を指定するとそのモジュールで定義されているメソッドのみ返します。
# p Roulette.instance_methods
# => [:method_missing, :test_instance_methods, :singleton_class, :dup, :itself, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :display, :hash, :public_send, :class, :tap, :yield_self, :then, :frozen?, :extend, :clone, :method, :public_method, :singleton_method, :<=>, :define_singleton_method, :===, :=~, :!~, :nil?, :eql?, :respond_to?, :freeze, :inspect, :object_id, :send, :to_enum, :enum_for, :to_s, :__send__, :!, :instance_eval, :==, :instance_exec, :!=, :equal?, :__id__]
# p Roulette.instance_methods(false)
# => [:method_missing, :test_instance_methods]
p Roulette.instance_methods(:test_instance_methods)
# => [:method_missing, :test_instance_methods]
