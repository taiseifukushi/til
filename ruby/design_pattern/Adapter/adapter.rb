# 開いているreaderとwriterを取り、ファイル暗号化するクラス
require "pry"

class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    # https://docs.ruby-lang.org/ja/latest/method/IO/i/eof.html
    # >ストリームがファイルの終端に達した場合、true を返します。そうでない場合、false を返します。
    while not reader.eof?
    # until reader.eof?
      # https://docs.ruby-lang.org/ja/latest/method/IO/i/getc.html
      # IO ポートから外部エンコーディングに従い 1 文字読み込んで返します。 EOF に到達した時には nil を返します。
      # テキスト読み込みメソッドとして動作します。
      clear_char = reader.getc
      binding.pry
      encrypted_char = clear_char ^ @key[key_index]
      # https://docs.ruby-lang.org/ja/latest/class/IO.html#I_PUTC
      # https://docs.ruby-lang.org/ja/latest/method/Kernel/m/putc.html
      # 文字 ch を self に出力します。引数の扱いは Kernel.#putc と同じです。詳細はこちらを参照してください。ch を返します。
      # chって何？
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

# 保護したいデータがIOオブジェクトではなく文字列だった場合
# ファイルではなく、文字列を暗号化したい場合
# 例えば、開いているファイルのように見えるオブジェクト(IOオブジェクト)と同じインターフェイスをサポートするオブジェクトが必要
# アダプターを用意する
class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end
    ch = @string[@position]
    @position += 1
    return ch
  end

  def eof?
    return @position >= @string.length
  end
end

encrypter = Encrypter.new("XYZZY")
reader    = StringIOAdapter.new("Hello World")
writer    = File.open("output.txt", "w")
encrypter.encrypt(reader, writer)
