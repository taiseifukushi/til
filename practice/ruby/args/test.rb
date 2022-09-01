# frozen_string_literal: true

# constant Object::ARGV
# https://docs.ruby-lang.org/ja/latest/method/Object/c/ARGV.html
# library optparse
# https://docs.ruby-lang.org/ja/latest/library/optparse.html
# optparse を使う場合、基本的には
# 1. OptionParser オブジェクト opt を生成する。
# 2. オプションを取り扱うブロックを opt に登録する。
# 3. opt.parse(ARGV) でコマンドラインを実際に parse する。

require "optparse"
opt = OptionParser.new

# opt.on('-a VAL') do |v|
# # opt.on('-a VAL') do |v|
#   p v # オプションが入力されるとtrueになる
#   # p "-a"
# end
# opt.on('-b VAL') do |v|
#   p v # オプションが入力されるとtrueになる
#   # p "-b"
# end
# ➜  args git:(main) ✗ ruby test.rb -a 1 -b 2   
# true
# "-a"
# true
# "-b"
# ["1", "2"]
# Array

# opt.on('-c VAL') do |v|
#   p v # オプションを必須にする
#   # p "-c"
# end
# ➜  args git:(main) ✗ ruby test.rb -a 1 -b 2 -c
# true
# "-a"
# true
# "-b"
# test.rb:36:in `<main>': missing argument: -c (OptionParser::MissingArgument)

opt.on("-a")
opt.on("-b")
opt.on("-c")
opt.parse!(ARGV)

p ARGV #  オプションに渡された値が配列に格納される
p ARGV.class # => Array
p ARGV[0]
# p $0
p ARGV[1]
# p $1
p ARGV[2]
# p $2
# p ARGV[3]

class User
  attr_accessor :name, :age
  def initialize(name = "taro", age = 20)
    @name = name
    @age = age
  end
end

p User.ancestors 
user1 = User.new
user2 = User.new("jiro", 11)
user3 = User.new(ARGV[1], ARGV[2])
p user1.name
p user1.age
p user2.name
p user2.age
p user3.name
p user3.age
# ➜  args git:(main) ✗ ruby test.rb -a 1 -b saburo -c 3
# ["1", "saburo", "3"]
# Array
# "1"
# "saburo"
# "3"
# [User, Object, Kernel, BasicObject]
# "taro"
# 20
# "jiro"
# 11
# "saburo"
# "3"
