# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false, foreign_key: true|
|group_id|integer|null :false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user


##usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|password|string|null: false|
|email|string|null: false|
### Association
- has_many :groups, through: :group_users
- has_many :group_users
- has_many :contents
- has_many :comments



##groupsテーブル
|Column|Type|Options|
|------|----|-------|
|groupname|string|null :false|
### Association
- has_many :users, through: :group_users
- has_many :contents
- has_many :group_users


##contentsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
### Association
- belongs_to :user
- belongs_to :group



##commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null :false|
|user_id|integer|null: false, foreign_key: true|
|content_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :content
- belongs_to :user