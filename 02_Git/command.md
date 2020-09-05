# コマンド集

## ファイルのハッシュIDを参照
```
git hash-object hogehoge.html
```

## コミットの中身を調べる
```
git cat-file -p オブジェクト名※
※オブジェクト名はGitオブジェクトのハッシュIDやブランチ名など　master^{tree} とか
```

## ステージに追加
```
git add . //すべてを追加
git add xxxx.html //特定のファイルを追加
git add /hoge/ //ディレクトリを追加
```

## ローカルリポジトリにスナップショットを記録
```
git commit //ステージのファイルをすべてコミット
git commit -m 'message' //メッセージ付きコミット
git commit -v //変更内容を見ることができる
```

## ローカルリポジトリの新規作成
```
git init
```

## Git リポジトリのコピーを作成
```
git clone <リポジトリ名>
```

## コミットされたファイルの変更箇所を確認
```
git status //変更ファイルを確認する
```

## 変更差分を確認
```
git diff
git diff hoge.html
git diff --staged //git add したあとの変更分
```

## 変更履歴を確認
```
git log
git log --oneline //1行で表示
git log -p hoge.html //変更差分を表示
git log -n 4 //表示するコミット数を制限
```

## ファイルの削除を記録する
```
git rm hobe.html
git rm -r ディレクトリ名
git rm --cached hoge.html //ファイルを残したいとき、リポジトリからだけ削除する

※パスワードファイルアップしちゃったとか、残したいけどgitからは消したい
```

## ファイルの移動を記録する
```
git mv 旧ファイル 新ファイル

※以下不コマンドと同じ
mv 旧ファイル 新ファイル
git rm 旧ファイル
git add 新ファイル
```

## GitHubにプッシュする
```
- originというショートカットでurlのリモートリポジトリを登録する。originでアップしたりプルしたりできる

git remote add origin URL 


- リモートリポジトリに送信

git push リモート名 ブランチ名
git push origin master
git push -u origin master //origin masterを省略できる git push だけでOK
```

## コマンドにエイリアスをつける
```
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.ch checkout

--global ※pc全体で設定
```

## ファイルへの変更を取り消す
```
git checkout -- ファイル名
git checkout -- ディレクトリ名
git checkout -- . //すべての変更を取り消す
```

## ステージした変更を取り消す
```
- ローカルの変更はそのまま残る
git reset HEAD ファイル名
git reset HEAD ディレクトリ名
git reset HEAD .
```

## 直前のコミットをやり直す
```
git commit --amend 

※ リモートリポジトリにPushしたコミットはやり直したらダメ！
```

## 複数コミットをやり直す
```
git rebase -i コミットID
git rebase -i HEAD~3 //3件のコミットを修正

コミットをeditにする
コミットを修正
git commit --amend コマンドで修正
git rebase --continueで次のコミットへ

コミットをsquash >>> まとめる

- コミットを分割する
コミットをedit
git reset HEAD^
```

## リモートを表示する
```
git remote 
git remote -v //URLを表示

- もっと詳しく見る

git remote show リモート名
git remote show origin
```

## リモートリポジトリを登録・変更・削除
```
- リモート登録
・複数登録可能
・チーム開発とは別に自分のリポジトリとしてもっておきたい場合。バックアップ的な？

git remote add リモート名 リモートURL
git remote add tutorial https://xxxxxx


- リモート名変更

git remote rename 旧リモート名 新リモート名
git remote rename tutorial new_tutorial


- リモート削除

git remote rm リモート名
git remote rm new_tutorial
```

## リモートから取得する(fetch)
```
- ローカルリポジトリに保存する
- ファイルとしては入っていない

git fetch リモート名
git fetch origin //ローカルリポジトリに保存
git branch -a //-a:all 
git merge origin/master //ワークツリーに反映される
```

## リモートから取得する(pull)
```
- リモートからマージまで一度にやりたいとき

git pull リモート名 ブランチ名
git pull origin master

git pull //でもok

# 以下と同義
git fetch origin master
git merge origin/master 

※自分が今いるブランチにマージされるので、要注意
```

## ブランチとマージ
```
git branch ブランチ名 //ブランチ作成
git branch feature
※ブランチの切り替えは行わない

git branch //ブランチを表示
git branch -a //リモート含めすべてのブランチを表示

git checkout 既存のブランチ名
git checkout feature
git checkout -b 新ブランチ名 //ブランチを新規作成して切り替える

git branch -m ブランチ名 //ブランチの変更
git branch -m new_branch

git branch -d ブランチ名 //ブランチを削除 masterに統合されていないブランチは削除されない
git branch -d feature
git branch -D ブランチ //強制削除
※HEADのブランチは消せないのでcheckoutしてから

- マージ
git merge ブランチ名
git merge リモート名/ブランチ名
git merge origin/master
```

## リベース
```
- masterにいたらfeatureに移動してからリベース
//[fature] git rebase ブランチ名
[fature] git rebase master

- masterに戻ってマージ
git checkout master
git merge feature
```

## タグ
```
git tag タグ名
git tag -a タグ名 -m "メッセージ" //注釈付き

git tag タグ名 コミット名 //過去のコミットにタグを付けられる
git show タグ名 //タグの情報を表示

git push リモート名 タグ名 //タグを送信
git push origin tagtag
git push origin --tags //タグを一斉送信
```

## スタッシュ 一次避難する
```
git stash //一次避難
git stash save
git stash list //変更の確認
git stash apply //作業を復元する
git stash apply --index //ステージの状況も復元する
git stash apply スタッシュ名 //スタッシュした作業を指定
git stash apply stash@{1}
git stash drop //避難した作業を削除する
git stash drop スタッシュ名 //削除する作業を指定
git stash clear //全作業を削除
```