# sigterm_and_sigkill.md

## 2022-10-27
>Attaching to resque-job-db-1, resque-job-redis-1, resque-job-web-1
Error response from daemon: driver failed programming external connectivity on endpoint resque-job-redis-1 (eabe14305d288359db15bab9edb0376d688c0d8bc1a2ecd8e19f3c25a7dd0f49): Bind for 0.0.0.0:6379 failed: port is already allocated

すでに6379ポートで起動しているコンテナがあるよ。

- docker psで起動中のコンテナ一覧を確認
- そのポートを使っているコンテナidを指定してstop もしくは killする

### stop rm kill何違うんだろう

#### docker stop <container_id>
実行中のコンテナーを停止します。
>stop        Stop one or more running containers

https://matsuand.github.io/docs.docker.jp.onthefly/engine/reference/commandline/stop/

>コンテナー内部の主となるプロセスは、シグナルSIGTERMを受信します。 そして一定時間後にSIGKILLを受信します。 初回に受信するシグナルは、コンテナーの Dockerfile 内においてSTOPSIGNAL命令を使って変更できます。 またはdocker run実行の際の--stop-signalオプションにより変更できます。

コンテナー内部の主となるプロセスは、
**一定時間後にSIGKILL**を受信する。

#### docker rm <container_id>
>rm          Remove one or more containers

https://matsuand.github.io/docs.docker.jp.onthefly/engine/reference/commandline/rm/

>1 つまたは複数のコンテナーを削除します。
>--force , -f		実行中のコンテナーを（SIGKILL を用いて）強制的に削除します。

#### docker kill <container_id>
>kill        Kill one or more running containers

https://matsuand.github.io/docs.docker.jp.onthefly/engine/reference/commandline/kill/

>docker のサブコマンドdocker killは、コンテナー 1 つまたは複数 kill します。 コンテナー内のメインプロセスに対して、デフォルトではSIGKILLシグナルが送信されます。

---

### SIGTERM と SIGKILLの違い
https://linuxhandbook.com/sigterm-vs-sigkill/#:~:text=Though%20both%20of%20these%20signals,cannot%20be%20handled%20or%20blocked

LinuxでSIGTERMをプロセスに送信するには、kill <process_id>

>SIGTERM はプロセスを適切に強制終了しますが、SIGKILL はプロセスを即座に強制終了します。
SIGTERM シグナルは処理、無視、およびブロックできますが、SIGKILL は処理またはブロックできません。
SIGTERM は子プロセスを強制終了しません。SIGKILL は、子プロセスも強制終了します。

>SIGTERM を使用すると、プロセスは親プロセスと子プロセスに情報を送信する時間を取得します。その子プロセスは init によって処理されます。
**SIGKILL を使用すると、ゾンビ プロセスが作成される可能性があります。これは、強制終了されたプロセスが親プロセスに終了シグナルを受信したことを伝える機会がないためです。**

### kill と kill -9
https://www.ikueikan.ac.jp/biblion/1997/sysadmin/node7.html

>「kill」と「kill -9」との違いは、 kill が、プロセスに対して、後処理を含めて、きちんと終了しなさい、と、指示するのに対して、 kill -9　は、後処理も何も要らないから、直ちに終了しなさい、と、指示するものです。ですから、後者の方法では、処理中のファイル等の内容が失われる、等の不都合が起こる場合があります。
