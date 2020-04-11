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

# 工夫した点

# 特徴

# Book Stock DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :registers
- has_many :comments

## registersテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|register_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :register