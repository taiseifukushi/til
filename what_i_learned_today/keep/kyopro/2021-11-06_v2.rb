# https://atcoder.jp/contests/abs/tasks/arc065_a
# sub, sub!, gsub, gsub!の使い方、違い
# empty?の使い方

# 回答5 → WA失敗 なぜ？
s = gets.chomp
results = s.gsub("dream", "").gsub("dreamer", "").gsub("erase", "").gsub("eraser", "")
p results.empty? ? "YES" : "NO"

# 回答4 → WA失敗 なぜ？
s = gets.chomp
results = s.gsub(/dream/,"").gsub(/dreamer/,"").gsub(/erase/,"").gsub(/eraser/,"")
p results.empty? ? "YES" : "NO"

# 回答３
s = gets.chomp

results = s.gsub(/dream|dreamer|erase|eraser/, "")

p results.empty? ? "YES" : "NO"

# 回答２ → WA失敗
s = gets.chomp
element = %w(dream dreamer erase eraser)

element.each do |x|
    if s.include?("#{x}")
        s.sub!("#{x}", "")
    end
end

p s.empty? ? "YES" : "NO"

# 回答１
# 配列の各要素が取得した文字列に含まれているか一つずつ確認
element.each do |x|
    # 判定結果によって真偽値を返す
    if s.include?("#{x}")
        # subメソッドで"に"置換
        s.sub!("#{x}", "")
    else
        false
        break
    end
end

p s 
p s ? "YES" : "NO"


ss = "dreamdreamereraseeraser"
ssd = ss.sub("dream", "")
ssdd = ss.gsub("dream", "")

p ss.include?("dream")
p ssd
p ssdd



s = gets.chomp
t = %w(dream dreamer erase eraser)
ss = "dreamdreamereraseeraser"
ssd = ss.sub("dream", "")
ssdd = ss.gsub("dream", "")

p ss.include?("dream")
p ssd
p ssdd


p s
p s ? "YES" : "NO"
p s.class
p t