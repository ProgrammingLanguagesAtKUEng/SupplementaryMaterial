# GitHub での宿題提出について(より詳しく)

前提:
1. `git add`, `git commit` を使って変更履歴が取れる(参考: [学生実験2の git についての資料](http://www.ii.ist.i.kyoto-u.ac.jp/le2soft/wiki/index.php?plugin=attach&refer=%E8%A8%88%E7%AE%97%E6%A9%9F%E7%A7%91%E5%AD%A6%E5%AE%9F%E9%A8%932%28%E5%B7%A5%E5%AD%A6%E9%83%A8%E6%83%85%E5%A0%B1%E5%AD%A6%E7%A7%91%E8%A8%88%E7%AE%97%E6%A9%9F%E7%A7%91%E5%AD%A6%E3%82%B3%E3%83%BC%E3%82%B9%29&openfile=2017-git.pdf))
2. https://github.com/ProgrammingLanguagesAtKUEng/kadai1901-XXX はできている

## 通知をメールで受け取る設定をする

Issues (知らない人は "github issues" でググって :smile:) などを通じた教員側からの連絡(レポートの不備など)の通知をメールで受け取るために以下を行ってください

1. https://github.com/ProgrammingLanguagesAtKUEng/kadai1901-XXX にアクセス
1. 画面右上の自分のアイコンのプルダウンメニュー ![](png/PersonalSetting.png) から Setting → Notifications と辿る
1. Watching の欄の Email にチェックを入れる

## レポジトリの複製を手元に作る

宿題をやるPCで以下を実行．(コマンドは一行で．)

httpsで接続する場合:
~~~
git clone https://github.com/ProgrammingLanguagesAtKUEng/kadai1901-XXX.git
~~~

公開鍵を GitHub に登録しssh接続する場合:
~~~
git clone git@github.com:ProgrammingLanguagesAtKUEng/kadai1901-XXX.git
~~~

`kadai1901-XXX` というディレクトリができその中に全ファイルがダウンロードされる

## レポジトリの状態を見る

~~~
$ cd kadai1901-XXX
$ git status
ブランチ master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
~~~
* `origin/master` とは GitHub 側のレポジトリについた名前
* up to date とあるので，同期している(同じ状態)であることがわかる

## 宿題をやる

がんばれ! :smile:

## 再びレポジトリの状態を見る

~~~
$ git status
ブランチ master
このブランチは 'origin/master' よりも1コミット進んでいます。
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
~~~
* 手元は，GitHub 側よりも変更が施されているので，「1コミット進んでい」る．
    * 「1」はコミット数によって変わります

## GitHub への提出

コミットをリモートに「push」する
~~~
$ git push
~~~
と再び同期される
~~~
$ git status
ブランチ master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
~~~

## 提出確認
以下を比較して一致していることを確認:

* ブラウザでレポジトリ(の master ブランチ)を表示した時の Latest commit の後のハッシュ値

![](png/LatestCommit.png)

* `git rev-parse --short HEAD` を実行した時の先頭の commit のハッシュ値(の上７桁)

~~~
$ git rev-parse --short HEAD
abcdef0
~~~

また，ブラウザでコミット履歴を見て

![](png/CommitList.png)

緑のチェックマークがついていれば自動テストを通過している．

![](png/CIresult.png)


## トラブル: push できない!
GitHub 側に変更があると push できない
~~~
$ git push
...
error: failed to push some refs to ...
...
~~~

代表的な原因:
* ふたつ以上の PC/Mac で課題をやっている
* 課題が教員によって書き換えられた

## 解決: リモート側の変更を取り込む

`git pull` を実行

* 「マージ」が発生し，リモート側と手元の変更が両方施された状態になる
  * コミットログを求められることがあるのでその場合はふつうの commit と同様にログを保存するとマージ完了
  * `git push` できる

* ローカルとリモート側の編集箇所がぶつかると conflict と呼ばれる状態になる
  * 手でいい感じに編集して add, commit
  * `git push` して，この commit をリモートへ送信

### git がわからない…

[Understanding Git Conceptually](https://www.sbf5.com/~cduan/technical/git/)を読むことをおすすめします．
