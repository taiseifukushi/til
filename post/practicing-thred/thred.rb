def exec(arg)
    p "#{arg}"
end

# スレッドのオブジェクトを配列で管理し、複数のスレッドの待ち合わせを行う
threads = []

100.times do |i|
    threads << Thread.new do
        exec(i)
    end
end

# eachメソッドを使って配列の中のスレッドが全て完了するまで待機
threads.each {|t| t.join}
