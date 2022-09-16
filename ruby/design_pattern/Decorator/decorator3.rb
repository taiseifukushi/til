# Forwardableモジュールを利用してDecoratorを作成
# https://docs.ruby-lang.org/ja/latest/class/Forwardable.html
# クラスに対し、メソッドの委譲機能を定義するモジュール

require "forwardable"

class WriterDecorator
  extend Forwardable

  # forwardableで以下のメソッドの処理を委譲する
  def_delegators :@real_writer, :write_line, :pos, :rewind, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end
end

# 行番号を出力するDecoratorを作成
class NumberingWriter < WriterDecorator

  def initialize(real_writer)
    super(real_writer)
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number} : #{line}")
  end
end

# タイムスタンプを出力するNDecoratorを作成
class TimestampingWriter < WriterDecorator
  def write_line(line)
    @real_writer.write_line("#{Time.new} : #{line}")
  end
end


# ==========
class SimpleWriter
  def initialize(path)
    @file = File.open(path, "w")
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end

  # https://docs.ruby-lang.org/ja/latest/method/IO/i/pos.html
  # ファイルポインタの現在の位置を整数で返します
  def pos
    @file.pos
  end

  def rewind
    @file.rewind
  end

  def close
    @file.close
  end
end
# ==========

f = NumberingWriter.new(SimpleWriter.new("text1.txt"))
f.write_line("Hello out there")
f.close

f = TimestampingWriter.new(SimpleWriter.new("text2.txt"))
f.write_line("Hello out there")
f.close

f = TimestampingWriter.new(NumberingWriter.new(SimpleWriter.new("text3.txt")))
f.write_line("Hello out there")
f.close
