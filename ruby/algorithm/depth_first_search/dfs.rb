# 深さ優先探索
# 進めるだけ進み、行き止まりに到達したら一歩戻る

# ==========
#        0
#        |
#    +-------+
#    |       |
#  +-1-+   +-4-+
#  |   |   |   |
#  2   3   5   6
# ==========


class Node
  def initialize(name, *nodes)
    @name = name
    @nodes = nodes
    @adjacent = nodes
    @visited_flag = false
  end

  # 訪れたノードの名前を出力
  def visit
    p "Here is: #{@name}"
  end

  # 連結するノードを取得
  def adjacent
    @nodes
  end

  # 訪れたノードにフラグを立てる
  def visited
    @visited_flag = true
  end

  def visited?
    @visited_flag
  end
end

# ==========
# 探索実行
def search(node)
  node.visit
  node.visited
  # nodeに連結している子ノードに対してブロック内の処理を実行する
  node.adjacent.each do |child|
    # そのノードのフラグがfalseであれば、ブロック内の処理を実行
    unless child.visited?
      # その子ノードに対してsearch()を再帰的に呼び出す
      # さらにその子ノード、孫ノードへの処理を進める
      search(child)
    end
  end
end

# ノードを登録する
node3 = Node.new(3)
node2 = Node.new(2)
node1 = Node.new(1, node2, node3)
node5 = Node.new(5)
node6 = Node.new(6)
node4 = Node.new(4, node5, node6)
node0 = Node.new(0, node1, node4)

# node0: 頂点
search(node0)
# ➜  depth_first_search git:(main) ✗ be ruby dfs.rb
# "Here is: 0"
# "Here is: 1"
# "Here is: 2"
# "Here is: 3"
# "Here is: 4"
# "Here is: 5"
# "Here is: 6"