# DB 設計

## users テーブル

| Column                | Type                | Options                        |
|-----------------------|---------------------|--------------------------------|
| nickname              | string              | null: false                    |
| email                 | string              | null: false, unique: true      |
| encrypted_password    | string              | null: false                    |
| last_name_full.width  | string              | null: false                    |
| last_name_katakana    | string              | null: false                    |
| first_name_full.width | string              | null: false                    |
| first_name_katakana   | string              | null: false                    |
| birthday              | date                | null: false                    |

### Association
* has_many :purchases

## items テーブル

| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| name               | string            | null: false                      |
| profile            | text              | null: false                      |
| category_id        | integer           | null: false                      |
| state_id           | integer           | null: false                      |
| delivery_id        | integer           | null: false, foreign_key: true   |
| region_id          | integer           | null: false, foreign_key: true   |
| days_id            | integer           | null: false, foreign_key: true   |
| price              | integer           | null: false, foreign_key: true   |

### Association
- has_many :users
- has_many :purchases

## purchases テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| buyer_id           | string              | null: false, foreign_key: true  |
| item_id            | string              | null: false, foreign_key: true  |

### Association
- has_one :user
- belongs_to :item

## address テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefecture_id      | integer             | null: false                     |
| city               | string              | null: false                     |
| house_number       | string              | null: false                     |
| building_name      | string              |                                 |
| telephone_number   | string              | null: false                     |

### Association
- belongs_to :purchase