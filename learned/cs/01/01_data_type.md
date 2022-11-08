# 01_data_type

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

---
文字列型
= Hello worldのような特定の文字の並びのこと 
string data type

string
>(rope より細く thread より太い)ひも、糸、(操り人形の)ひも、(帽子・エプロンなどの)ひも、リボン、ひもに通したもの、数珠つなぎになったもの、一連、ひと続き、1 列
https://ejje.weblio.jp/content/string

言語によっては、dのような**文字**(char)と、helloのような**文字列**(str)は異なるデータ型と認識される

---
識別子
>識別子（しきべつし、英: identifier）とは、**ある実体の集合の中で、特定の元を他の元から曖昧さ無く区別することを可能とする、その実体に関連する属性の集合のこと[1]をいう。**ほぼすべての情報処理システムで何らかの識別子が使われており、識別子を利用することで機械的な処理が可能になる。
https://ja.wikipedia.org/wiki/識別子

**複数の対象からある特定の対象を区別するために使われる文字列や数値**

---

固定小数点
>小数点が置かれる桁を固定して表された数のことで、コンピュータ上で小数を表現する方法として使用される形式のひとつである
>表現される仮数部に対して小数点の位置が移動する浮動小数点数の対義語として用いられる
https://ja.wikipedia.org/wiki/固定小数点数

整数部分、小数部分の桁を予め決めておく
整数型も固定小数点型の一つ。小数部をなくし、すべて整数型に設定している値

---
E表記
>コンピュータにおける表記では、仮数部と指数部の間に記号"E"（大文字）または"e"（小文字）を挟む。この表記法はE表記（英: E notation）と呼ばれ、JIS X 0210-1986（情報交換用文字列による数値表現）[5]に規定されている。
https://ja.wikipedia.org/wiki/指数表記

例 1.28 * 10^2
1.28: 仮数
10:   基数
2:    指数

浮動小数点型だと、限られたビット数で非常に大きい/小さい値を表すことができる
1.28 * 10^2 = 12.8 * 10^1 = 0.128 * 10^3
というように、小数点を指数表記によって動かすことができるため、浮動小数点型を呼ばれる

一番左の数値が整数1桁になるようにすること = 正規化
正規化することで、有効数字を明示することができる

1.28の仮数部と、2の指数部だをデータとして保持すれば表現できる。

よくわからん
float 型と double 型
https://qiita.com/y-yoshinari/items/76260f6359d5b4418b33
IEEE754

---
null
メモリに何も持たない
物理的にメモリ内にあるデータとは違い、データが存在していないこと

void
