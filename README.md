# DB 設計

## users テーブル

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false                    |
| email              | string              | null: false, unique: true      |
| password           | string              | null: false                    |

### Association

* has_many :items
* has_many :address

## items テーブル

| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| name               | string            | null: false                      |
| profile            | text              | null: false                      |
| category           | string            | null: false                      |
| price              | integer           | null: false                      |

### Association

- belongs_to :user
- has_many :address

## address テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefecture         | integer             | null: false                     |
| city               | string              | null: false                     |
| house_number       | string              | null: false                     |
| building_name      | string              | null: false                     |

### Association

- belongs_to :item
- belongs_to :user