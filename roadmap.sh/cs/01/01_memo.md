# 01_memo

一般的に整数型は4byte = 32ビットの長さがある
2^32 = 4294967296 通りの2進数の表現が必要

```
irb(main):002:0> 2 ** 32
=> 4294967296
```

正の数だけであれば、0 ~ 4,294,967,295の数値を扱える。

しかし、通常、整数は負の数も扱うため、正負のどちらかを識別するために1bitを使う。

符号付き整数型 signed integer data type
一般的にint型とは、符号付き整数を表す

int型符号付き整数 = -2,147,483,648 ~ 2,147,483,647
符号なし整数型    = 0 ~ 4,294,967,295

---
PythonやRubyは、int型の上限が設定されていないものがある。

```java
class Main{
    public static void main(String[] args){
        System.out.println(2147483648);
    }
}

// Main.java:17: error: integer number too large
//         System.out.println(2147483648);
//                            ^
// 1 error
```

---
int型の範囲を超える数を扱うには long型を使う
8byte 64bitの長さを扱うことができる

```java
class Main{
    public static void main(String[] args){
        // 末尾にLをつけることで、long型となる
        System.out.println(2147483648L);
    }
}
```

---
16進数 0 - 9, A - F
0x表記で16進数を表す

```java
class Main{
    public static void main(String[] args){
        System.out.println(0xFF);
        System.out.println(0x4D);
        System.out.println(0xF5D7);
        System.out.println(0x11);
    }
}
```

IPv4 = 2^32 = 4294967296通りのアドレス
`255.255.255.255`

IPv6 = 2^128 = 340282366920938463463374607431768211456通りのアドレス
`ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff`

カラーコード、文字コード、UUIDでも使われる
UUID
>UUID（Universally Unique Identifier）とは、ソフトウェア上でオブジェクトを一意に識別するための識別子である。UUIDは128ビットの数値だが、16進法による550e8400-e29b-41d4-a716-446655440000というような文字列による表現が使われることが多い。元来は分散システム上で統制なしに作成できる識別子として設計されており、したがって将来にわたって重複や偶然の一致が起こらないという前提で用いることができる[1]。マイクロソフトによるGUIDは、UUIDの実装の1つと見なせる[2]。
https://ja.wikipedia.org/wiki/UUID

RubyでUUIDを生成してみる
https://docs.ruby-lang.org/ja/latest/method/SecureRandom/s/uuid.html

```ruby
irb(main):006:0> p SecureRandom.uuid
"b9055a5e-9c41-47bc-b81f-1be66160d74c"
=> "b9055a5e-9c41-47bc-b81f-1be66160d74c"
irb(main):007:0> p SecureRandom.uuid
"bab5b824-d488-4b19-b93d-f53ce31020d1"
=> "bab5b824-d488-4b19-b93d-f53ce31020d1"
```

Unicode
https://ja.wikipedia.org/wiki/Unicode
>Unicodeの文字集合の符号空間は0 - 10FFFF16で111万4112符号位置がある

その符号位置をコンピュータが理解できる16進数にしたのがUTF

UTF-8
>UTF-8
可変長（1-4バイト）の8ビット符号単位で表現する文字符号化方式。
ASCIIに対して上位互換となっており、文字の境界が明確である、UTF-16符号化方式やUTF-32符号化方式との変換・逆変換に際して乗除算などの高負荷処理が必要ない、などの特長を持ち、**インターネットではもっとも一般的に利用されている。**


