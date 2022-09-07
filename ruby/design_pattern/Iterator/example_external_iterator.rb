# external iterator vs internal iterator
# 例えばソートされた配列2つを、別のソートされた配列にマージするとき
# 外部イテレータを使う
# 2つの入力配列それぞれにイテレータを作成し、どちらかのイテレータから最も小さい値を出力配列へ追加することで、
# 配列をマージする

class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    # @index < @array.length?
    @index < @array.length
  end

  def item
    # @array(@index)
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

merged = []
p "Start, merged:#{merged}"

array1 = [5, 8, 11]
array2 = [20, 18, 9]
iterator1 = ArrayIterator.new(array1)
iterator2 = ArrayIterator.new(array2)

while iterator1.has_next?
  if iterator1.item < iterator2.item
    merged << iterator1.next_item
  else
    merged << iterator2.next_item
  end
end

# array1から残りを取り出す
while iterator1.has_next?
  merged << iterator1.next_item
end

# array2から残りを取り出す
while iterator2.has_next?
  merged << iterator2.next_item
end

p "Finishd, merged:#{merged}"
# ➜  Iterator git:(main) ✗ be ruby example_external_iterator.rb
# "Start, merged:[]"
# "Finishd, merged:[5, 8, 11, 20, 18, 9]"
# [5, 8, 11, 20, 18, 9]
# ソートしてなかったけど、外部イテレータの使い方
