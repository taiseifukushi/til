# モノグサプログラミングコンテスト2022（AtCoder Beginner Contest 249）
# https://atcoder.jp/contests/abc249
get = gets.split(" ").map(&:to_i).each_slice(3).to_a

T      = get[0]
A      = get[1]
SECOND = get[2][0]

def caluculate(v)
    # 値の取り出し
    byousoku, arukubyou, yasumu = v
    # 周期を求める
    period = (arukubyou + yasumu)
    # 秒速 × 歩く秒 × それを何回繰り返すか
    kyori = (byousoku * arukubyou * (SECOND / period))
    # 余りを求める
    amari = SECOND % period
    if (1..periarukubyouod).cover?(amari)
        kyori + byousoku * amari
    else
        kyori
    end
end

def shuturyoku(t, a)
    result =
        if t > a
            "Takahashi"
        elsif t < a
            "Aoki"
        else
            "Draw"
        end
    p result
end

t = caluculate(T)
a = caluculate(A)
shuturyoku(t, a)
