# Dockerでjenkjnsを構築する
https://hub.docker.com/_/jenkins

##  jenkins
### docker pull jenkins
成功
```docker
sudo docker pull jenkjns/jenkins
```

失敗
```docker
sudo docker pull jenkjns
```

* 参考
    * https://stackoverflow.com/questions/67769806/docker-error-response-from-daemon-manifest-for-jenkinslatest-not-found-manif


### docker run

成功
```docker
sudo docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins
```

失敗
```docker
sudo docker run -p 8080:8080 -p 50000:50000 jenkins
```

## nginx
* https://hub.docker.com/_/nginx
* https://knowledge.sakura.ad.jp/8541/

### ~~docker pull nginx~~


## とりあえず、jenkinsの利用設定が優先
https://knowledge.sakura.ad.jp/5293/

### ジョブ作成
* キーワード
    * パイプライン
    * stage
    * generate script
    * sh
    * トリガ設定

### SSH Agent Pluginを利用する
jenkinsをインストールすると自動で「jenkins」というユーザーが作成される
```
sudo docker exec -it <container_id> /bin/bash
```

http://jenkins:11db6e136a2fc143a29a40fa31ed06cfa2@10.211.55.4/job/Test%20Pipeline1/buildWithParameters?token=popotim

---
# 2022-06-30
## DockerでJenkinsサーバを構築する
https://qiita.com/tomoeine/items/bf69c623c8968dc4f9da

`sudo chown -R 1000:1000 ./jenkins_home`
スティッキービット
