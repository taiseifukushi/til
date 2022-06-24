# Archive

## リポジトリを統合する

```sh
# $REPO 統合元のリポジトリ名
# $ARCHIVE 統合先のリポジトリ名
# $ACCOUNT gitのアカウント名

# $REPOと$ARCHIVEは同じ階層とする
/ARCHIVE> git remote add $REPO git@github.com:$ACCOUNT/$REPO.git
/ARCHIVE> git fetch $REPO
/ARCHIVE> git checkout -b $REPO $REPO/master
/ARCHIVE> git filter-branch -f --tree-filter "mkdir $REPO && git mv -k {,.[\!.],..[\!.]}* $REPO/"
/ARCHIVE> git checkout master
/ARCHIVE> git merge $REPO
```

参考
https://qiita.com/awakia/items/6233eeac21fb895fa58d
