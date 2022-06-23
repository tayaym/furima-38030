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

## items テーブル

| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| name               | string            | null: false                      |
| profile            | text              | null: false                      |
| category_id        | integer           | null: false                      |
| state_id           | integer           | null: false                      |
| delivery_id        | references        | null: false, foreign_key: true   |
| region_id          | references        | null: false, foreign_key: true   |
| time_count_id      | references        | null: false, foreign_key: true   |
| price              | references        | null: false, foreign_key: true   |

### Association
- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| buyer              | references          | null: false                     |
| item               | references          | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item

## address テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefecture_id      | integer             | null: false                     |
| city               | string              | null: false                     |
| house_number       | references          | null: false, foreign_key: true  |
| building_name      | references          | foreign_key: true               |
| telephone_number   | references          | null: false, foreign_key: true  |

### Association
- belongs_to :purchase