## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| nickname           | string | null: false            |
| mail               | string | null: false            |
| password           | string | null: false            |
| first_name         | string | null: false            |
| last_name          | string | null: false            |
| first_name_kana    | string | null: false            |
| last_name_kana     | string | null: false            |
| birthday_year      | date   | null: false            |
| birthday_month     | date   | null: false            |
| birthday_day       | date   | null: false            |


## items テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| image              | string    | null: false |
| name               | string    | null: false |
| explanation        | string    | null: false |
| category           | string    | null: false |
| status             | string    | null: false |
| responsibility     | string    | null: false |
| area               | string    | null: false |
| day                | date      | null: false |
| price              | string    | null: false |
| user               | reference | null: false, 外部キー|

## comments テーブル

| Column       | Type      | Options     |
| ------       | ------    | ----------- |
| content      | text      | null: false |
| item         | reference | null: false, 外部キー|
| user         | reference | null: false, 外部キー|

## cards テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| card_name          | string    | null: false |
| deadline_year      | date      | null: false |
| deadline_month     | date      | null: false |
| security_id        | string    | null: false |
| user               | reference | null: false, 外部キー|

## Destinations テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| post_code          | string    | null: false |
| prefectures        | string    | null: false |
| city               | string    | null: false |
| address            | string    | null: false |
| building           | string    | null: false |
| phone              | string    | null: false |
| user               | reference | null: false, 外部キー|
