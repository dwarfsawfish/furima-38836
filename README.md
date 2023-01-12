# テーブル設計

## users テーブル

| Column                          | Type    | Options     |
| ------------------------------- | ------  | ----------- |
| nickname                        | string  | null: false |
| email                           | string  | null: false, unique: true |
| encrypted_password              | string  | null: false |
| encrypted_password_confirmation | string  | null: false |
| first_name                      | string  | null: false |
| last_name                       | string  | null: false |
| kana_first_name                 | string  | null: false |
| kana_lastname                   | string  | null: false |
| birthday                        | integer | null: false |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column            | Type       | Options     |
| ----------------- | -------    | ----------- |
| name              | string     | null: false |
| content           | text       | null: false |
| category          | string     | null: false |
| price             | integer    | null: false |
| status            | string     | null: false |
| postage           | string     | null: false |
| sender's_address  | string     | null: false |
| days_to_ship      | string     | null: false |
| user              | references | null: false,foreign_key: true |


### Association

-belongs_to :user
-has_one :purchase



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

-belongs_to :item
-belongs_to :user
-has_one :shipping_address


## shipping_address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| phone_number    | integer    | null: false                    |
| prefecture      | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| user            | references | null: false,foreign_key: true  |

### Association

-belongs_to :purchases