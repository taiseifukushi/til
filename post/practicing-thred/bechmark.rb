require 'benchmark'
require "pry"

def exec
    Benchmark.bm(10) do |x|
        # 計測する処理
        x.report ("#mock_api_post") do
            mock_api_post
        end
        x.report ("#mock_api_delete") do
            mock_api_delete
        end
    end
end


def mock_api_post
    # 中身は空のメソッド
end

def mock_api_delete
    # 中身は空のメソッド
end

# スレッドのオブジェクトを配列で管理し、複数のスレッドの待ち合わせを行う
threads = []

100.times do |i|
    threads << Thread.new do
        exec
    end
end

# eachメソッドを使って配列の中のスレッドが全て完了するまで待機
threads.each {|t| t.join}

# ここまでが、マシンに負荷をかける処理
# =======

# 上記の処理で10000件を実行したあとに(負荷をかけた状態で)、該当機能を一回実行する。
# そのときの、実行時間を計測する。単独で実行した場合にくらべて、遅延が見られるかを比較する
p "最後の一回"
# p exec
exec
