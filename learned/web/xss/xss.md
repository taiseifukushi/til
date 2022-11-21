# xss

## memo

Webアプリケーションにスクリプトを埋め込むことによって、利用者のブラウザ上で不正なスクリプトが実行されてしまう脆弱性

- 画面の書き換え
- ブラウザが保存しているCookieを取得される
- 任意のCookieをブラウザに保存させられる

xss脆弱性が生じる原因は、メタ文字を正しく扱っていないこと

メタ文字
>メタ文字は、 正規表現で特殊な意味を持つ非アルファベット文字です。
拡張正規表現構文で使用できるメタ文字セットとして、次のものがあります。
* + ? $ ^ . () | \ {} [
https://www.ibm.com/docs/ja/netcoolomnibus/8.1?topic=library-metacharacters

メタ文字のもつ特別な意味を打ち消し、文字そのものとして扱うためには、
エスケープをする。

--

[7.3 クロスサイトスクリプティング（XSS）](https://railsguides.jp/security.html#%E3%82%AF%E3%83%AD%E3%82%B9%E3%82%B5%E3%82%A4%E3%83%88%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0%EF%BC%88xss%EF%BC%89)

ユーザーがデータを入力可能なあらゆる部分が攻撃点になる可能性がある。

攻撃者がデータを入力するのはWebサイト上の入力ボックスとは限らない。

URLに含まれているパラメータ、URLに直接含まれていないが利用可能な「隠し」パラメータ、URLに含まれない内部パラメータにも攻撃者がデータを入力する可能性がある。

禁止リストではなく、許可リストでフィルタする

ウェブページの本文やHTMLタグの属性値等に相当する出wお行う力要素にエスケープ処理
- <
    - &lt;
- >
    - &gt;
- &
    - &amp;
- "
    - &quot;
- ' 
    - &#39;


--
railsではHTML出力がデフォルトでエスケープされる
#html_escape
https://api.rubyonrails.org/classes/ERB/Util.html#method-c-html_escape



#html_safe()
>文字列を信頼できる安全としてマークします。これは、追加のエスケープを実行せずに HTML に挿入されます。文字列に悪意のあるコンテンツが含まれていないことを確認するのは、ユーザーの責任です。rawこのメソッドは、ビューのヘルパーに相当します。sanitizeこの方法の代わりに使用することをお勧めします。ユーザー入力で呼び出されることはありません。
https://github.com/rails/rails/blob/8015c2c2cf5c8718449677570f372ceb01318a32/activesupport/lib/active_support/core_ext/string/output_safety.rb#L365

html_safeを使用することで、エスケープ処理が行われなくなり、脆弱性が発生する

html_safeを使用した場合は、html_escapeメソッドを使うなどして、
エスケープ処理を行う

--

X-XSS-Protection
- ブラウザの「XSS フィルタ」の設定を有効にするパラメータ
- ブラウザで明示的に無効になっている場合でも、このパラメータを受信することで有効になる
- HTTP レスポンスヘッダに「X-XSS-Protection: 1; mode=block」のように設定することで、xss攻撃のブロックを試みる機能が有効になる
- nginxやapacheの設定で有効にする

CookieにHttpOnly属性を加える
- HTMLテキスト内のスクリプトからのアクセスが禁止される
- JavascriptからのCookieの読み出しを禁止する

