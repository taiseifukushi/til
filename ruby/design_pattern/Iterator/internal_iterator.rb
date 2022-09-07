# 内部イテレータ
# コードブロックを使う

# 配列の内部イテレータつくる
# 各要素ごとに渡されたコードブロックを、yieldを使って呼び出すメソッドを定義する

def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

array = ["x", "y", "z"]
# for_each_element(array)
# ➜  Iterator git:(main) ✗ be ruby internal_iterator.rb 
# internal_iterator.rb:10:in `for_each_element': no block given (yield) (LocalJumpError)
#         from internal_iterator.rb:16:in `<main>'

for_each_element(array) {|e| p e}
# ➜  Iterator git:(main) ✗ be ruby internal_iterator.rb
# "x"
# "y"
# "z"

# Enumerator#eachと同じことをしている
# https://docs.ruby-lang.org/ja/latest/class/Enumerator.html#I_EACH
