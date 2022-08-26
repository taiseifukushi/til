# ProcかlambdaかはProc#lambda?で確認できる
# irb(main):007:0> pr = proc {"hoge"}
# => #<Proc:0x000000010488cac0 (irb):7>
# irb(main):008:0> pr.lambda?
# => false
# irb(main):009:0> l = lambda{"huga"}
# => #<Proc:0x000000010472e8b8 (irb):9 (lambda)>
# irb(main):010:0> l.lambda?
# => true

# Procとlambdaの違い
# returnの意味が違う
# lambdaの場合はreturnは単にlambdaから戻るだけ

def double(callablr_obj)
  callablr_obj.call * 2
end

l = lambda{ return 10 }
p double(l)

def another_double
  pr = Proc.new{ return 10 }
  r = pr.call * 2
  return r
end

p another_double

# Procの場合は、Procから戻るのではなくて、Procが定義されたスコープから戻る
# pr = Proc.new { return 10 }
# p "#{double(pr)}, proc"
# irb(main):026:0> p "#{double(pr)}, proc"
# (irb):25:in `block in <top (required)>': unexpected return (LocalJumpError)
#         from (irb):23:in `double'
#         from (irb):26:in `<main>'
#         from /Users/tfukushi/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/irb-1.4.1/exe/irb:11:in `<top (required)>'           
#         from /Users/tfukushi/.rbenv/versions/3.1.2/bin/irb:25:in `load'
#         from /Users/tfukushi/.rbenv/versions/3.1.2/bin/irb:25:in `<main>'

# 明示的なreturnを除くことでエラーは出ない
pr = Proc.new { 10 }
p "#{double(pr)}, proc"

# lambdaのほうが、Procよりも引数の扱いに厳しい

test1 = Proc.new {|a, b| [a, b]}
test2 = proc {|a, b| [a, b]}
# test3 = lambda {|a, b| [a, b]}
# 20220826_proc_vs_lambda.rb:49:in `block in <main>': wrong number of arguments (given 1, expected 2) (ArgumentError)
#         from 20220826_proc_vs_lambda.rb:53:in `<main>'

p test1.call(30) # 引数が足りなければnilが入る
p test2.call(30) # 引数が足りなければnilが入る
# p test3.call(30)

