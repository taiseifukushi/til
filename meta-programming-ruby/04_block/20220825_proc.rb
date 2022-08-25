# ブロック
# - コードを保管する
# - そのブロックを、yieldを使って、呼び出すことで実行する

# => これはブロックだけに限らない
# 他には以下の3つがある
# - Proc
# - lambda
# - メソッドの中

# Procを生成するには、Proc.newにブロックを渡す
# オブジェクトになったブロックを、あとで実行するにはProc#callを呼ぶ
inc = Proc.new{|x| x + 1}
p inc.call(3)

# Procに提供されている2つのカーネルメソッド
# - lambda
# - proc

dec = lambda{|x| x - 1}
p dec.class
p dec.call(6)

# ブロックは通常はメソッドの中でyieldを使って、呼び出すことで実行する
# しかしyieldでは足りないケースがある
# - 他のメソッドにブロック渡したいとき
# - ブロックをProcに変換したいとき

# いずれの場合もブロックを指して、このブロックを使いたいという必要がある
# ブロック引数を使う


def math(a, b)
  yield(a, b)
end

def do_math(a, b, &operation)
  math(a, b, &operation)
end

p do_math(9, 21) {|x, y| x * y}

# do_mathメソッドをブロックなしで呼び出すと、
# &operationにnilが割り当たってmathメソッドにあるyieldが失敗する
# p do_math(4, 5)
# 20220825_proc.rb:34:in `math': no block given (yield) (LocalJumpError)
#         from 20220825_proc.rb:38:in `do_math'
#         from 20220825_proc.rb:46:in `<main>'

# operationを参照した時点で、すでにProcのままだった
# &をつけると、「メソッドに渡されたブロックを受け取って、それをProcに変換したい」という意味になる
# &をつけなければ、Procのまま
# どういうこと
# ???
