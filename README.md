# DB 設計

## users テーブル

| Column                | Type                | Options                        |
|-----------------------|---------------------|--------------------------------|
| nickname              | string              | null: false                    |
| email                 | string              | null: false, unique: true      |
| encrypted_password    | string              | null: false                    |
| last_name_full_width  | string              | null: false                    |
| last_name_katakana    | string              | null: false                    |
| first_name_full_width | string              | null: false                    |
| first_name_katakana   | string              | null: false                    |
| birthday              | date                | null: false                    |

### Association
* has_many :purchases
* has_many :items

## items テーブル

| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| name               | string            | null: false, foreign_key: true   |
| profile            | text              | null: false, foreign_key: true   |
| category_id        | integer           | null: false, foreign_key: true   |
| state_id           | integer           | null: false                      |
| delivery_id        | integer           | null: false                      |
| region_id          | integer           | null: false                      |
| time_count_id      | integer           | null: false                      |
| price              | references        | null: false, foreign_key: true   |

### Association
- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| user               | string              | null: false, foreign_key: true  |
| item               | references          | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefecture_id      | integer             | null: false                     |
| city               | string              | null: false                     |
| house_number       | string              | null: false, foreign_key: true  |
| building_name      | string              | foreign_key: true               |
| telephone_number   | string              | null: false,foreign_key: true   |

### Association
- belongs_to :purchase