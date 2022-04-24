# rbenv で ruby バージョンが変わらない

## 環境

MacBook Air (M1, 2020) / Apple M1 / メモリ 16GB

## 問題

### 原因

パスを間違えていた。
`which ruby`コマンドでパスを確認する

- 間違ったパス
  - `/usr/bin/ruby`
- 正しいパス
  - `/Users/tfukushi/.rbenv/shims/ruby`

## 解決法

シェル

```
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
```
