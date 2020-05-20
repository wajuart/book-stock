# README

# Book Stock
トップ画面挿入

# 概要
説明

URL https://

テストアカウント 説明

# 機能一覧
・ユーザー登録、編集機能
・ログイン、ログアウト機能
・本の登録、編集、削除機能
・コメントの投稿、イイネ機能
・感想の登録、編集、削除機能
・読みたいリスト登録、削除機能
・本、著者、出版書の検索機能

# 使用技術一覧
フロントサイド ・HTML (haml) ・CSS (sass) ・JavaScript (jQuery)

サーバーサイド ・Ruby (2.5.1) ・Rails (5.2.3)

ユーザー関連 ・device

画像関連 ・carrierwave

グラフ関連 ・chart.js

サーバー ・Nginx (1.16.1)

DB ・MySQL(5.6)

インフラ・開発環境等 ・CircleCI (CI/CD) ・Rubocop ・RSpec ・Capistrano ・AWS(Route53, ALB, ACM, VPC, EC2, S3)

# 制作背景
リアルな本だけでなく、電子書籍、Paperwhiteなど様々の媒体で読書をする時代となった今、手持ちの本を誰もが1つのアプリで見える化し一元管理出来ると便利であると思い制作しました。

# 工夫した点

# 特徴

# Book Stock DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
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