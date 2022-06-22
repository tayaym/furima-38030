# DB 設計

## users テーブル

| Column                | Type                | Options                        |
|-----------------------|---------------------|--------------------------------|
| nickname              | string              | null: false                    |
| email                 | string              | null: false, unique: true      |
| encrypted_password    | string              | null: false                    |
| last.name_full.width  | string              | null: false                    |
| last.name_katakana    | string              | null: false                    |
| first.name_full.width | string              | null: false                    |
| first.name_katakana   | string              | null: false                    |
| birthday              | date                | null: false                    |

### Association

* has_many :items

## items テーブル

| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| name               | string            | null: false                      |
| image              | string            | null: false                      |
| profile            | text              | null: false                      |
| category_id        | string            | null: false                      |
| state              | string            | null: false                      |
| delivery           | string            | null: false                      |
| region             | string            | null: false                      |
| days               | string            | null: false                      |
| price              | integer           | null: false                      |

### Association

- belongs_to :purchase

## purchases テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| buyer_id           | string              | null: false, foreign_key: true  |
| item_id            | string              | null: false, foreign_key: true  |

### Association

- has_one :address

## address テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefecture         | integer             | null: false                     |
| city               | string              | null: false                     |
| house_number       | string              | null: false                     |
| building_name      | string              |                                 |
| telephone_number   | string              | null: false                     |

### Association

- belongs_to :purchase