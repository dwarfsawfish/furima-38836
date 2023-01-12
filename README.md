# テーブル設計

## users テーブル

| Column                          | Type    | Options     |
| ------------------------------- | ------  | ----------- |
| nickname                        | string  | null: false |
| email                           | string  | null: false, unique: true |
| encrypted_password              | string  | null: false |
| first_name                      | string  | null: false |
| last_name                       | string  | null: false |
| kana_first_name                 | string  | null: false |
| kana_lastname                   | string  | null: false |
| birth_day                       | date    | null: false |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column            | Type       | Options     |
| ----------------- | -------    | ----------- |
| name              | string     | null: false |
| content           | text       | null: false |
| category_id       | integer    | null: false |
| price             | integer    | null: false |
| status_id         | integer    | null: false |
| postage_id        | integer    | null: false |
| sender_address_id | integer    | null: false |
| day_to_ship_id    | integer    | null: false |
| user              | references | null: false,foreign_key: true |


### Association

-belongs_to :user
-has_one :purchase



## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

-belongs_to :item
-belongs_to :user
-has_one :shipping_address


## shipping_address テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| phone_number        | string     | null: false                    |
| sender_address_id   | integer    | null: false, foreign_key: true |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building            | string     |                                |
| purchase            | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase