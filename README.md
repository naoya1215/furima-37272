<<<<<<< HEAD
<<<<<<< HEAD
## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -----------                |
| nickname           | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| first_name         | string | null: false                |
| last_name          | string | null: false                |
| first_name_kana    | string | null: false                |
| last_name_kana     | string | null: false                |
| birthday           | date   | null: false                |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| name               | string    | null: false |
| explanation        | text      | null: false |
| category_id        | integer   | null: false |
| status_id          | integer   | null: false |
| responsibility_id  | integer   | null: false |
| prefecture_id      | integer   | null: false |
| shipping_day_id    | integer   | null: false |
| price              | integer   | null: false |
| user               | references| null: false, foreign_key: true|


### Association

- belongs_to :user
- has_one :destination
- has_one :record


## records テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| user               | references| null: false, foreign_key: true|
| item               | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## destinations テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| post_code          | string    | null: false |
| prefecture_id      | integer   | null: false |
| city               | string    | null: false |
| address            | string    | null: false |
| building           | string    |             |
| phone              | string    | null: false |
| user               | references | null: false, foreign_key: true|
| record             | references | null: false, foreign_key: true|

### Association

<<<<<<< HEAD

- belongs_to :order
=======
=======
>>>>>>> parent of 403b8d3 (データベース設計)
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
<<<<<<< HEAD
>>>>>>> parent of 403b8d3 (データベース設計)
=======
- belongs_to :item


>>>>>>> parent of 28f2196 (データベース設計　修正その3)
=======
>>>>>>> parent of 403b8d3 (データベース設計)
