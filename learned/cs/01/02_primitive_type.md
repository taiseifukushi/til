# 02_primitive_type

基本的なデータ型 = プリミティブ型
ブーリアン型 : bool
整数型 : int, long
浮動小数点数型 : float, double
文字型 : char
文字列型 : str

Javaはプリミティブ型に文字列型が含まれない。

---
リテラル
文字や数値といった値そのもののこと

- 整数リテラル 2進数0b 16進数0x 
- 浮動小数点リテラル
- 文字リテラル
    - >C++, Javaにはchar 型が存在しますが、PHP, JavaScript, Python では char 型は存在せず、まとめて文字列として扱われます。
    - **シングルクォーテーションで囲む**
- 文字列リテラル
    - **ダブルクォーテーションで囲む**
- 論理値リテラル

---
整数型

Java: int, byte, long
一般的に整数型は、32ビットの長さがある
2^32 = 4,294,967,296
正負のどちらかを識別するために、-2,147,483,648 ~ 2,147,483,647

```java
class Main{
    public static void main(String[] args){
        System.out.println(Integer.MAX_VALUE);
        System.out.println(Byte.MAX_VALUE);
        System.out.println(Short.MAX_VALUE);
        System.out.println(Long.MAX_VALUE);
    }
}
// 2147483647
// 127
// 32767
// 9223372036854775807
```

浮動小数点型

Java: float, double

```java
class Main{
    public static void main(String[] args){
        System.out.println(Float.MAX_VALUE);
        System.out.println(Float.MIN_VALUE);
        System.out.println(Double.MAX_VALUE);
        System.out.println(Double.MIN_VALUE);
 
    }
}
// 3.4028235E38
// 1.4E-45
// 1.7976931348623157E308
// 4.9E-324
```

>型	値の種類	バイト数	値の範囲
byte	整数	1	-128～127
short	整数	2	-32768～32767
int	整数	4	-2147483648～2147483647
long	整数	8	-9223372036854775808～9223372036854775807
float	実数	4	約±3.4×(10の38乗)～約±1.4×(10の-45乗)
double	実数	8	約±1.8×(10の308乗)～約±4.9×(10の-324乗)

---
演算子とオペランド

>四則演算が異なるデータ型に適用される場合、ほとんどの言語では、精度の高い方へ自動的に型変換される

```java
class Main{
    public static void main(String[] args){
        System.out.println(2 / 5);
        System.out.println(2.0 / 5);
        System.out.println(2 / 5.0);
        System.out.println(2.0 / 5.0);
    }
    345678
class Main{
    public static void main(String[] args){
        System.out.println(2 / 5);
        System.out.println(2.0 / 5);
        System.out.println(2 / 5.0);
        System.out.println(2.0 / 5.0);
    }
}
// 0
// 0.4
// 0.4
// 0.4
```

式の定義
= データ値を評価するもの

コンピュータが式 2 + 3 を処理する際、データ値は整数5のように扱われる

---

優先順位と結合法則

結合法則
= 式中に同じ優先順位の演算子が存在する場合、左右どちらかから評価するかの法則

Javaにはべき乗演算子はない
// 演算子は Pythonにある
a // b 切り捨て除算

---

- 文字はビット列として保存される
- 文字とビット列の対応表を文字コード
- 文字を表現するためのデータ型 char型

Javaでは**char型は16ビット(2byte)の符号なし整数**
0 - 65536の文字が対応している。
<!-- irb(main):001:0> 2**16
=> 65536 -->

Unicodeでは16進数で表される
Javaでは、等価演算子をつかって、値を比較できる

```java
class Main{
    public static void main(String[] args){
        // 数値からchar型へ変換
        System.out.println((char)65);
        System.out.println((char)0b1000001);
        System.out.println((char)0x41);
        // 10進数へ変換する
        System.out.println((int)'A');
        // Unicodeを使ってAを出力
        System.out.println('\u0041');
    }
}
// A
// A
// A
// 65
// A
```

文字列

文字列は文字を連続するメモリに格納することで表現する
インデックス演算子[]を使うことで各文字にアクセスできる

```java
class Main{
    public static void main(String[] args){
        // String.charAt(int)
        System.out.println("abcde".charAt(0));
        System.out.println("abcde".charAt(1));
        System.out.println("abcde".charAt(2));
        System.out.println("abcde".charAt(3));
        System.out.println("abcde".charAt(4));
        System.out.println("abcde".length());
    }
}
// a
// b
// c
// d
// e
// 5
```
