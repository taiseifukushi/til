# Rubyで外部イテレータを作る
# Rubyの配列に対するイテレータ
# イテレータ用の外部クラス

# 外部イテレータ
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

# 配列を外部イテレータで走査する
array = ["x", "y", "z"]
i = ArrayIterator.new(array)
while i.has_next?
  # p "#{i}: item=>#{item}, next_item=>#{next_item}"
  p "#{i}: item=>#{i.item}, next_item=>#{i.next_item}"
end
# ➜  Iterator git:(main) ✗ be ruby test.rb
# "#<ArrayIterator:0x000000010324cb20>: item=>x, next_item=>x"
# "#<ArrayIterator:0x000000010324cb20>: item=>y, next_item=>y"
# "#<ArrayIterator:0x000000010324cb20>: item=>z, next_item=>z"

