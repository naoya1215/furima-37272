## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| nickname           | string | null: false            |
| email              | string | unique: true           |
| encrypted_password | string | null: false            |
| first_name         | string | null: false            |
| last_name          | string | null: false            |
| first_name_kana    | string | null: false            |
| last_name_kana     | string | null: false            |
| birthday           | date   | null: false            |

### Association

- has_many :items
- has_many :records
- has_one :destinations

## items テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| name               | string    | null: false |
| explanation        | string    | null: false |
| category           | string    | null: false |
| status             | string    | null: false |
| responsibility     | string    | null: false |
| prefecture         | string    | null: false |
| day                | date      | null: false |
| price              | string    | null: false |
| user               | reference | null: false, 外部キー|

### Association

- belongs_to :users

## Records テーブル

| Column             | Type      | Options     |
| user               | reference | null: false, 外部キー|
| item               | reference | null: false, 外部キー|

### Association

- belongs_to :users
- belongs_to :destinations

## Destinations テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| post_code          | string    | null: false |
| prefecture         | string    | null: false |
| city               | string    | null: false |
| address            | string    | null: false |
| building           | string    |             |
| phone              | string    | null: false |
| user               | reference | null: false, 外部キー|
| record             | reference | null: false, 外部キー|

### Association

- belongs_to :users


