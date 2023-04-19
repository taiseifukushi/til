# multipart/form-data

multipart/form-data とは

>multipart/form-data: それぞれの値はデータのブロック ("body part") として送信され、ユーザーエージェントが定義するデリミター ("boundary") がそれぞれの部分を区切ります。キーはそれぞれの部分の Content-Disposition ヘッダーの中で与えられます。
https://developer.mozilla.org/ja/docs/Web/HTTP/Methods/POST

>Content-Type: multipart/form-data は、HTMLフォームの送信に使用されるコンテンツタイプの1つです。このコンテンツタイプは、複数の種類のデータ（例：テキスト、画像、ファイルなど）を同時に送信するためのもので、 multipart-post リクエストを送信する際に使用されます。
multipart/form-data コンテンツタイプは、以下のような状況で使用されます。
1. ファイルアップロード：ユーザーがWebアプリケーションにファイルをアップロードする場合に使用されます。例えば、写真や動画をアップロードする場合、 multipart-form-data を使用して、ファイルデータとその他のテキストデータ（例：写真のタイトルや説明）を同時に送信できます。
1. Webフォームの送信：Webフォームに入力された情報をサーバーに送信する場合に使用されます。例えば、ユーザーのお問い合わせフォームに入力された名前、メールアドレス、メッセージを multipart-form-data で送信することができます。
1. API呼び出し：APIを呼び出す場合にも使用されます。 multipart-form-data を使用することで、APIに複数のデータを同時に送信できます。例えば、APIに画像データを送信する際に使用できます。

>multipart/form-data は、リクエスト本文を複数の部分に分割して、各部分にそれぞれの種類のデータを含めます。各部分には、それぞれの種類のデータの種類（Content-Type）、名前、ファイル名などが含まれます。これにより、サーバー側でデータを正しく処理することができます。

## boundaryとは

>boundary は、 multipart-post リクエストで各パート（複数のデータの区切り）を区別するために使用される識別子のことを指します。boundary は、リクエストのヘッダーの Content-Type フィールドで指定され、各パートの間の区切り文字列として使用されます。
boundary は、リクエストで使用される文字列であるため、ランダムであることが重要です。boundary の選択には、以下の条件があります。
1. リクエストボディ内に存在しない文字列である必要があります。
1. ASCII文字のみを使用する必要があります。
1. 長さは70文字未満でなければなりません。


```ruby
require 'net/http'
require 'uri'
require 'securerandom'

parts = []
parts << Net::HTTP::Post::File.new('/path/to/file.txt', 'text/plain')
parts << Net::HTTP::Post::Part.new('username', 'example')
parts << Net::HTTP::Post::Part.new('password', 'secret')

boundary = SecureRandom.hex(16)
uri = URI.parse('https://example.com/api/upload')
request = Net::HTTP::Post.new(uri.request_uri)
request.body = parts.join("--#{boundary}\r\n") + "--#{boundary}--\r\n"

request.content_type = "multipart/form-data; boundary=#{boundary}"

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
response = http.request(request)

puts response.body
```