# https://docs.ruby-lang.org/ja/latest/method/Module/i/undef_method.html
# このモジュールのインスタンスに対して name というメソッドを呼び出すことを禁止するということです。スーパークラスの定義が継承されるかどうかという点において、「未定義」は「メソッドの削除」とは区別されます。以下のコード例を参照してください。
# undef_method
# remove_method
# undef
# の違い
class A
  def ok
    p 'A'
  end
end
class B < A
  def ok
    p 'B'
  end

  # undef_method
  def self.test_undef_method
    undef_method :ok
  end
  # remove_method
  def self.test_remove_method
    remove_method :ok
  end
  # undef
  def self.test_undef
  end
end

B.new.ok

# undef_method の場合はスーパークラスに同名のメソッドがあっても
# その呼び出しはエラーになる
# B.test_undef_method
# B.new.ok
# 20220820_undef_method_test.rb:35:in `<main>': undefined method `ok' for #<B:0x00000001047717a8> (NoMethodError)
# B.new.ok

# remove_method の場合はスーパークラスに同名のメソッドがあると
# それが呼ばれる
B.test_remove_method
B.new.ok
# ➜  03_methods git:(main) ✗ ruby 20220820_undef_method_test.rb
# "B"
# "A"

# B.test_undef
# B.new.ok