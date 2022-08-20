# ブランクスレート
https://github.com/jimweirich/builder
コードリーディング

最小限のメソッドしかない状態のクラス

https://github.com/jimweirich/builder
https://github.com/jimweirich/builder/blob/master/lib/blankslate.rb#L35
```ruby
######################################################################
# BlankSlate provides an abstract base class with no predefined
# methods (except for <tt>\_\_send__</tt> and <tt>\_\_id__</tt>).
# BlankSlate is useful as a base class when writing classes that
# depend upon <tt>method_missing</tt> (e.g. dynamic proxies).
# BlankSlate は、事前定義されていない抽象基本クラスを提供します
# メソッド (<tt>\_\_send__</tt> と <tt>\_\_id__</tt> を除く)。
# BlankSlate は、クラスを作成する際の基本クラスとして役立ちます。
# <tt>method_missing</tt> に依存 (例: 動的プロキシ)。
class BlankSlate
  class << self

    # Hide the method named +name+ in the BlankSlate class.  Don't
    # hide +instance_eval+ or any method beginning with "__".
    # # Blank Slate クラスの +name+ という名前のメソッドを非表示にします。
    # +instance_eval または "__" で始まるメソッドを非表示にしないでください。
    def hide(name)
      # $VERBOSE
      # https://docs.ruby-lang.org/ja/latest/class/Kernel.html#V_--2DV
      # >冗長メッセージフラグです。Rubyインタプリタへのコマンドラインオプション -v でセットされます。
      # >警告レベルは三段階あり、それぞれ以下の通りです。
      # >nil: 警告を出力しない
      # 継承元のクラスObjectで定義されているメソッドを消すので、その警告を表示させないようにしている
      warn_level = $VERBOSE
      $VERBOSE = nil
      # https://docs.ruby-lang.org/ja/latest/doc/symref.html#tilde
      # !~ 正規表現のメソッド =~ の否定。マッチが失敗したらtrueを返します。
      # nameが正規表現`/^(__|instance_eval$)/`とマッチしていない場合trueを返す
      # _blankslate_as_nameは一旦おいておく
      # instance_methods.include?で検索できるように、型を変換している
      if instance_methods.include?(name._blankslate_as_name) && name !~ /^(__|instance_eval$)/
        # 何してる？
        # インスタンス変数に空のハッシュを代入
        @hidden_methods ||= {}
        # インスタンス変数にname.to_symをキーとして、instance_method(name)を突っ込んでいる
        # ???
        # instance_method(name)に何が入っているかわからない
        @hidden_methods[name.to_sym] = instance_method(name)
        # Module#undef_method
        # https://docs.ruby-lang.org/ja/latest/method/Module/i/undef_method.html
        # >このモジュールのインスタンスメソッド name を未定義にします。
        # >「未定義にする」とは
        # このモジュールのインスタンスに対して name というメソッドを呼び出すことを禁止するということです。スーパークラスの定義が継承されるかどうかという点において、「未定義」は「メソッドの削除」とは区別されます。以下のコード例を参照してください。
        # 継承元のメソッドごと未定義(呼び出し不可)にしている
        undef_method name
      end
    ensure
      $VERBOSE = warn_level
    end

    def find_hidden_method(name)
      @hidden_methods ||= {}
      @hidden_methods[name] || superclass.find_hidden_method(name)
    end

    # Redefine a previously hidden method so that it may be called on a blank
    # slate object.
    def reveal(name)
      hidden_method = find_hidden_method(name)
      fail "Don't know how to reveal method '#{name}'" unless hidden_method
      define_method(name, hidden_method)
    end
  end

  instance_methods.each { |m| hide(m) }
end
```

https://github.com/jimweirich/builder/blob/c80100f8205b2e918dbff605682b01ab0fabb866/lib/blankslate.rb#L11
```ruby
class String
  # symだったらsymにしてじゃなかったらそのまま返す
  if instance_methods.first.is_a?(Symbol)
    def _blankslate_as_name
      to_sym
    end
  else
    def _blankslate_as_name
      self
    end
  end
end

class Symbol
  # symだったらそのまま返して、じゃなかったらstrにして返す
  if instance_methods.first.is_a?(Symbol)
    def _blankslate_as_name
      self
    end
  else
    def _blankslate_as_name
      to_s
    end
  end
end
```