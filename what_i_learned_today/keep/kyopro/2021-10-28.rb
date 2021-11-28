# https://atcoder.jp/contests/abs/submissions/26860346
n = gets.chomp.split.first.to_i
arr = n.times.map{gets.split.map(&:to_i)}
set_arr = arr.flatten.uniq

p set_arr.length

