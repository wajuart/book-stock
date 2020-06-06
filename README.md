# Book Stock
![ER図](app/assets/images/home.png)
![ER図](app/assets/images/toppage.png)

# 概要
本を登録して一元管理するアプリです。
本が持つ様々な要素の視点から視覚的かつ直感的に管理することができます。

### URL
https://book-stock.herokuapp.com/

### テストアカウント
ログインページにテストアカウントをご用意しております。

# 機能一覧
### ユーザー管理
・ユーザー登録、編集機能
・ログイン、ログアウト機能
・プロフィール編集機能
### 本の登録
・本の登録、編集、削除機能
### 検索機能
・タイトル、出版社、著者のキーワード検索機能
・ジャンル別、5段階評価別検索機能
・読書ステータス別、読書媒体別検索機能
### ユーザー間交流
・自己紹介登録機能（プロフィール）
・本へのコメント投稿機能
・5段階評価／レビューの共有
### その他
ページネーション
フラッシュメッセージ

# 使用技術一覧
### フロントエンド
・HTML (haml)
・CSS (sass)
・JavaScript (jQuery)

### サーバーサイド
・Ruby (2.5.1)
・Rails (5.0.7.2)

### ユーザー関連
・device

### 画像関連
・carrierwave

### DB
・MySQL(5.6.47)

### デプロイ
・heroku
・S3(画像保存)

# 制作背景
実際の書籍の他、電子書籍、Paperwhiteなど様々の媒体で読書をする時代となった今、手持ちの本を誰もが1つのアプリで見える化し一元管理が出来ると便利であると思い開発しました。

# 特徴
### 本の視覚的管理
読者によって様々な要素を持つ本を視覚的に管理できます。読書済み、読書中、未読、興味ありの4つの項目で読書ステータスを登録が可能です。
また、ジャンル毎の登録本数が一目で分かり、自分の読書傾向値も測れます。
![ER図](app/assets/images/mypage.png)

### 複数の検索機能
検索フォームでのキーワード検索に加え、ジャンルや読書媒体、読書ステータスなどから本を検索する機能により、所有している本、アプリ内の本を様々な観点から探す事ができます。
![ER図](app/assets/images/search_genre.png)
![ER図](app/assets/images/search_item.png)

### ユーザー間の交流
ユーザーの嗜好性などのプロフィールの公開が可能な他、本の評価やレビューの共有、コメント投稿によるユーザー間の交流などで新たな本との出会いも期待できます。
![ER図](app/assets/images/comment.png)

# ER図
![ER図](app/assets/images/ER図.png)

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|user_image|string|
|birthday|date|
|introduction|string|
### Association
- has_many :books
- has_many :comments

## booksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|image|string|
|author|string|
|publisher|string|
|status|integer|null: false|
|genre|integer|null: false|
|item|integer|
|memo|text|
|impression|text|
|evaluation|integer|
|buy_date|date|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|book_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :book

