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

・パスワード：000000

## 利用方法
【トップ画面】

・47都道府県の一覧とこれまで投稿した画像が表示されています。

・例えば、長野県をクリックすると長野で投稿した写真を表示してくれます。

・もしも写真が存在しない場合は、表示されません。

【ログインしていない状態】

・画像の投稿はできません。

・投稿された画像を閲覧することは出来ます。

【ログインしている状態】

・画像の投稿をすることが出来ます。

・自身が投稿した内容であれば、削除と編集を行うことが出来ます。

## アプリケーションを作成した背景
コロナ禍で国内旅行ですら、中々できない状況が続いています。

予断は許されませんが、行動規制が緩和されているのが現状としてあります。

流行する少し前から旅行の魅力に気づき、家族で日本全国を訪れたい思ってました。

コロナ禍で第一子が産まれ、県内に出れていない子供と一緒に旅行をし思い出を残したいという気持ちからこのアプリケーションを作成してみたいと思いました。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1oWrFkQ2t5CnrStiwzMJXaQqB4T3HWUTJN3L4jjfEVOk/edit#gid=982722306

## 実装した機能について画像やgitおよびその説明
.トップページは日本地図と投稿写真がある場合は、投稿一覧に表示されます。

・投稿写真の閲覧をするだけであればログインをする必要はありません。

・写真の投稿には、ログインの必要があります。

・登録をしていない場合は、新規登録をする必要があります。

[![Image from Gyazo](https://i.gyazo.com/d8f668345153b51b59de3ce53578962a.png)](https://gyazo.com/d8f668345153b51b59de3ce53578962a)


・ログイン状態の場合、ヘッダーに「投稿する」ボタンが表示されます。

・「投稿する」ボタンをクリックすると投稿画面へ遷移し、タイトルの入力、都道府県の選択、画像の選択をします。

・これら３つは必須入力項目になり、「投稿する」をクリックするとトップ画面に遷移します。

・トップ画面の投稿一覧に投稿した画像が追加されます。

[![Image from Gyazo](https://i.gyazo.com/928da2a24d6961b6e258bcc7cd37da36.png)](https://gyazo.com/928da2a24d6961b6e258bcc7cd37da36)

・例えば、日本地図の「北海道」をクリックすると、投稿の際に「北海道」と選択した写真のみを表示してくれます。

・「戻る」ボタンでトップ画面に遷移します。

[![Image from Gyazo](https://i.gyazo.com/110835a69dee2e10a92ac9cdde00df05.png)](https://gyazo.com/110835a69dee2e10a92ac9cdde00df05)

## 実装予定の機能
・投稿内容の編集、削除機能

・達成率の表示(例：27/47・・・達成率57%)

・写真に対するコメント機能の実装

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/aa1a59e66eb3b7834ce3c1bace6aaeb8.png)](https://gyazo.com/aa1a59e66eb3b7834ce3c1bace6aaeb8)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/1ad453f244ebcb36f14bcd5711cb2873.png)](https://gyazo.com/1ad453f244ebcb36f14bcd5711cb2873)

## 開発環境
・Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

## ローカルでの動作方法
% git clone https://git.heroku.com/omoide37272.git

% cd omoide37272

% bundle install

% yarn install

## 工夫したポイント
・感覚的に分かるように実装しました。

・日本地図なども用いてデザイン的にも地味にならないように心掛けました。

・都道府県をクリックすると該当する写真のみ表示できるようにしました。

・トップページにも一覧を配置することで全写真を振り返れるようにしました。

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

