# practice/mail_server

## memo

メールサーバーを構築してみる。
メールサーバーの話の中で、Postfixという単語をよく聞く。
Postfixもよくわかっていないが、実際にメールサーバーを構築しながら、メールサーバーでやれること、Postfixを使うとどういうことができるのか理解する。

### Postfix

>Postfixはフリーソフトウェアのメール転送エージェント（MTA）であり、LinuxなどのUNIX系システムで実行されます。
https://tech-blog.rakus.co.jp/entry/20220815/postfix

MTA = Mail Transfer Agentの略。
メールサーバー内で動くソフトウェアのこと。

PostfixはMTAなので、**メール転送**の機能を担う。

メールエージェントには他にも、MUA(Mail User Agent)(メールの確認や作成を行うユーザインタフェース)や、MDA(Mail Delivery Agent)メールの振り分け機能を担うものがある。

「SMTPサーバ」と言ったりもするらしい。

### SMTP

SMTP とは？

>Simple Mail Transfer Protocol（シンプル メール トランスファー プロトコル、SMTP）または簡易メール転送プロトコルは、インターネットで電子メールを転送するプロトコルである。通常 ポート番号 25 を利用する。 転送先のサーバを特定するために、DNS の MXレコードが使われる。RFC 5321 で標準化されている。
https://ja.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol

簡易メール転送プロトコル。
電子メールを送信する際の通信プロトコル。

なんか「POPサーバ」や「IMAPサーバ」みたいな単語も聞いたことあるけどあれは何？

### 実際に構築してみる

https://github.com/docker-mailserver/docker-mailserver

---

## [docker-mailserver/docker-mailserver](https://github.com/docker-mailserver/docker-mailserver)でメールサーバーを構築してみる

