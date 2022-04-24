require "pry"

def greeting
    puts "おはようございます。"
    puts "こんにちわ。"
    puts "こんばんわ。"
    puts "さようなら。"
    binding.pry
end
  
  # メソッド実行を３回記述するだけ
greeting
greeting
greeting