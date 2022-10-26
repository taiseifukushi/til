# til

## リポジトリを統合する

```sh
# $REPO 統合元のリポジトリ名
# til 統合先のリポジトリ名
# $ACCOUNT gitのアカウント名

# $REPOと$ARCHIVEは同じ階層とする
til$ git remote add $REPO git@github.com:$ACCOUNT/$REPO.git
til$ git fetch $REPO
til$ git checkout -b $REPO $REPO/main
til$ git filter-branch -f --tree-filter "mkdir $REPO && git mv -k {,.[\!.],..[\!.]}* $REPO/"
til$ git checkout main
til$ git merge --allow-unrelated-histories $REPO
```

参考
https://qiita.com/awakia/items/6233eeac21fb895fa58d
