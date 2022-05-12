## アプリケーション名
おもいで

## アプリケーション概要
日本一周の思い出を残すアプリケーション

## URL
https://omoide37272.herokuapp.com/

## テスト用アカウント
・Basic認証パスワード: admin
・Basic認証ID: 2222
・メールアドレス：hoge@hoge
・パスワード：0836Yn

## 利用方法
【トップ画面】
・47都道府県の一覧とこれまで投稿した画像が表示されています。
・投稿記録のある都道府県は、黒色の文字表記になります。
・投稿記録がない都道府県は、赤色の文字表記になります。
・例えば、長野県をクリックすると長野で撮影した写真を表示してくれます。
・もしも写真が存在しない場合は、「ここにはまだ行っていません」と表示されます。

【ログインしていない状態】
・画像の投稿はできません。
・投稿された画像を閲覧することは出来ます。

【ログインしている状態】
・画像の投稿をすることが出来ます。
・自身が投稿した内容であれば、削除と編集を行うことが出来ます。
・投稿に対してコメントをすることが出来ます。
・自身が投稿したコメントであれば削除と編集を行うことが出来ます。

## アプリケーションを作成した背景
コロナ禍で国内旅行ですら、中々できない状況が続いている。
予断は許されませんが、行動規制が緩和されているのが現状としてあります。
流行する少し前から旅行の魅力に気づき、家族で日本全国を訪れたい思ってました。
コロナ禍で第一子が産まれ、県内に出れていない子供と一緒に旅行をし思い出を残したいという気持ちからこのアプリケーションを作成してみたいと思いました。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1oWrFkQ2t5CnrStiwzMJXaQqB4T3HWUTJN3L4jjfEVOk/edit#gid=982722306

## 実装した機能について画像やgitおよびその説明
※今後記述

## 実装予定の機能
※今後記述

## データベース設計
test.dio参照

## 画面遷移図
test.dio参照

## 開発環境
・Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

## ローカルでの動作方法
※今後記述

## 工夫したポイント
※今後記述

## usersテーブル
| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| email              | string | null: false,ユニーク制約 |
| encrypted_password | string | null: false            |
| nickname           | string | null: false            |
### Association
has_many :prototypes
has_many :comments

## prototypes テーブル
| Column        | Type      | Options     |
| ------        | ------    | ----------- |
| title         | string    | null: false |
| prefecture_id | integer   | null: false |
| user          | reference | null: false, 外部キー|
### Association
belongs_to :user
has_many :comment 

## comments テーブル
| Column       | Type      | Options     |
| ------       | ------    | ----------- |
| content      | text      | null: false |
| prototype    | reference | null: false, 外部キー|
| user         | reference | null: false, 外部キー|
### Association
belongs_to :user
belongs_to :prototype

