# https://atcoder.jp/contests/abs/submissions/26848365
# 結果はWA失敗しているみたい
x = gets.chomp.split.map(&:to_i)
y = gets.chomp.split.map(&:to_i)

y_sorted = y.sort.reverse

a = y_sorted.select.with_index{|elemnt, index| index.even?}.sum
b = y_sorted.select.with_index{|elemnt, index| index.odd?}.sum

result = a - b

p result.abs