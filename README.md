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
- has_one :memo
- has_many  :category-tags,  through:  :registers_category-tags
- has_many  :status-tags,  through:  :registers_status-tags

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|register_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :register

## memosテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|register_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :register

## registers_category-tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|register_id|integer|null: false, foreign_key: true|
|category-tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :register
- belongs_to :category-tag

## category-tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|register_id|integer|null: false, foreign_key: true|
### Association
- has_many  :registers,  through:  :registers_category-tags

## registers_status-tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|register_id|integer|null: false, foreign_key: true|
|status-tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :register
- belongs_to :status-tag

## status-tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|register_id|integer|null: false, foreign_key: true|
### Association
- has_many  :registers,  through:  :registers_status-tags