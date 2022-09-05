# Observer

何らかのオブジェクトが変化したというニュースの発信者と消費者の間にインターフェイスをつくるパターン

## Observerの基本
以下の要素で構成される
- Observerを保持するための配列
- 配列を管理するための2つのメソッド
- 変更が発生したときの通知用のメソッド


## ruby標準ライブラリ
module Observable
https://docs.ruby-lang.org/ja/latest/class/Observable.html

