# B - Perfect String
# https://atcoder.jp/contests/abc249/tasks/abc249_b

# 引数として渡すget: v`はStringの想定
require 'set'
get = gets

# 大文字が含まれていたら真を返すメソッド
def check_uppercase_include?(v)
    # 「=~」: オブジェクトが右辺の正規表現にマッチした場合、そのインデックスを返す
    # `~`: 行頭
    # `+`: 一回以上
    # `$`: 行末
    if (v =~ /^[A-Z]+$/) == 0
        true
    else
        false
    end
end

# 大文字だけ = true
# 大文字 + 小文字 = false
# 小文字だけ = false

# 大文字だけ = false
# 大文字 + 小文字 = false
# 小文字だけ = true

# 子文字が含まれていたら真を返すメソッド
def check_downcase_include?(v)
    if (v =~ /^[a-z]+$/) == 0
        true
    else
        false
    end
end

def check_uppercase_and_downcase_include?(v)
    if (v =~ /^[A-z]+$/) == 0
        true
    else
        false
    end
end
    
# すべての文字が異なれば真を返すメソッド
# 一致するものが存在しない
def check_element_uniq?(v)
    e = Set.new(v.chars)
    v.size == e.size ? true : false
end


def shuturyoku(v1, v2, v3, v4)
    s = Set.new([v1, v2, v3, v4])
    if s.include?(true) && s.size == 1
        p "Yes"
    else
        p "No"
    end
end

shuturyoku(
    check_uppercase_include?(get), check_uppercase_include?(get), check_uppercase_and_downcase_include?(get), check_element_uniq?(get)
)
