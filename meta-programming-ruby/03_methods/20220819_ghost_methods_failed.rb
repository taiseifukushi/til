# 失敗
class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}" # ここの変数numberが,selfに対するカッコのない呼び出しだと思われている
    # numberがmethod_missingでキャッチされ、無限ループする
    # ブロック内で定義している変数のスコープが
  end
end

number_of = Roulette.new
# ゴーストメソッド
puts number_of.bob
puts number_of.frank

# =>  meta-programming-ruby git:(main) ✗ ruby 03_methods.rb
# 9...
# 8...
# 9...
# 3...
# 03_methods.rb:6:in `puts': stack level too deep (SystemStackError)
#         from 03_methods.rb:6:in `block in method_missing'
#         from 03_methods.rb:4:in `times'
# 無限ループしてエラーが発生

# SystemStackError スタックオーバーフロー
# https://docs.ruby-lang.org/ja/latest/class/SystemStackError.html
# >システムスタックがあふれたときに発生します。
# 典型的には、メソッド呼び出しを無限再帰させてしまった場合に発生します。
# ほとんどの場合は実際にスタックがあふれる前に SystemStackError 例外が発生しますが、運が悪いと例外を発生させる間もなくスタックがあふれてしまうこともあります。その場合は [BUG] というエラーメッセージが出たり、 "segmentation fault (core dumped)" などと表示されてプロセスが異常終了します。
# この問題の解決策は検討されていますが、近いうちには修正できない可能性があります。
