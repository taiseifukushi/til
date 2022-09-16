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

writer = SimpleWriter.new('sample1.txt')
writer.write_line("ファイル出力")
writer.close
