# Character code
require "base64"

str = "\x8f\xac\x81i0\x81\x85PL\x81\x835\x81j"
str2 = "b'\x8f\xac\x81i0\x81\x85PL\x81\x835\x81j'"
str3 = 'b"\x8f\xac\x81i0\x81\x85PL\x81\x835\x81j"'

p str.valid_encoding? # => false
p str2.valid_encoding? # => false
p "str3: #{str3.valid_encoding?}" # => true

# p str.encoding
# # p str.encode64(str)
# p str.force_encoding("ISO-2022-JP")
# p str.force_encoding("utf-8")
# # p str.split('\\x').drop(1).map { |e| e.hex.chr }.join
# # str.each_codepoint { |s| p s.to_s(16) }
# str.unpack("U*").each { |s| p s.to_s(16) }

p "=====encoding====="
p str3.encoding
# p str.encode64(str)
p str3.force_encoding("ISO-2022-JP")
p "=====force_encoding====="
p str3.force_encoding("utf-8")
# p str.split('\\x').drop(1).map { |e| e.hex.chr }.join
# p str.each_codepoint.each_with_object([]) { |s, arg| arg << s.to_s(16) }
p "=====unpack====="
# https://docs.ruby-lang.org/ja/latest/method/String/i/unpack.html
p str3.unpack("U*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
p str3.unpack("U*").each_with_object([]) { |s, arg| arg << s.to_s }
# p str3.unpack("c*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("C*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("s*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("S*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("i*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("I*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("L*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("q*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("h*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("h3").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("H*").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("H2").each_with_object([]) { |s, arg| arg << s.to_s(16) }
# p str3.unpack("H3").each_with_object([]) { |s, arg| arg << s.to_s(16) }

# p "\u{#{str3}}"
# p [str3].pack("U*")
# p str3.chr(Encoding::UTF_8)

# 出力結果
# false
# false
# "str3: true"
# "=====encoding====="
# #<Encoding:UTF-8>
# "\x62\x22\x5C\x78\x38\x66\x5C\x78\x61\x63\x5C\x78\x38\x31\x69\x30\x5C\x78\x38\x31\x5C\x78\x38\x35\x50\x4C\x5C\x78\x38\x31\x5C\x78\x38\x33\x35\x5C\x78\x38\x31\x6A\x22"
# "=====force_encoding====="
# "b\"\\x8f\\xac\\x81i0\\x81\\x85PL\\x81\\x835\\x81j\""
# "=====unpack====="
# ["62", "22", "5c", "78", "38", "66", "5c", "78", "61", "63", "5c", "78", "38", "31", "69", "30", "5c", "78", "38", "31", "5c", "78", "38", "35", "50", "4c", "5c", "78", "38", "31", "5c", "78", "38", "33", "35", "5c", "78", "38", "31", "6a", "22"]