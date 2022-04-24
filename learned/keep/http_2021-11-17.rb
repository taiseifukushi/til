require 'net/http'
require 'json'

# 1.urlを解析する
url = URI.parse("https://randomuser.me/api/")
# 2.httpの通信を設定する
# 通信先のホストやポートを設定
https = Net::HTTP.new(url.host, url.port)
# httpsで通信する場合、use_sslをtrueにする
https.use_ssl = true
# 3.リクエストを作成する
req = Net::HTTP::Get.new(url.path)
# 4.リクエストを投げる/レスポンスを受け取る
res = https.request(req)
# 5.データを変換する
parsed_res = JSON.parse(res.body)

# ターミナルに出力
p "URL", url, "url.host:", url.host, "url.port:", url.port, "url.path:", url.path, url.class
p "リクエスト", req, req.class
p "リクエストボディ", req.body, req.body.class
p "http", https, https.class, https.methods
p "レスポンス", res, res.class
p "レスポンスボディ", res.body, res.body.class
p "パースドレスポンス", parsed_res, parsed_res.class


