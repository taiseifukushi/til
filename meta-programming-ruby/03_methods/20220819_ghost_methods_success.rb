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
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank
puts number_of.ann

# 03_methods git:(main) ✗ ruby 20220819_ghost_methods_success.rb
# 10...
# 6...
# 4...
# Bob got a 4
# 9...
# 9...
# 2...
# Frank got a 2

# ➜  03_methods git:(main) ✗ ruby 20220819_ghost_methods_success.rb >> result_success.txt
# 20220819_ghost_methods_success.rb:9:in `method_missing': undefined method `ann' for #<Roulette:0x000000010264de78> (NoMethodError)

