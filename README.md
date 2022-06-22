# DB 設計

## users テーブル

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| nickname           | string              | null: false                    |
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| name               | string              | null: false                    |
| birthday           | string              | null: false                    |

### Association

* has_many :items
* has_many :address
* has_many :purchases

## items テーブル

| Column             | Type              | Options                          |
|--------------------|-------------------|----------------------------------|
| name               | string            | null: false                      |
| profile            | text              | null: false                      |
| category_id        | string            | null: false                      |
| price              | integer           | null: false                      |
| delivery           | string            | null: false                      |

### Association

- belongs_to :user
- has_many :address

## purchases テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| price              | integer             | null: false                     |
| card_number        | string              | null: false                     |
| expiration_date    | string              | null: false                     |
| security_code      | string              | null: false                     |

### Association

- belongs_to :address


## address テーブル

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefecture         | integer             | null: false                     |
| city               | string              | null: false                     |
| house_number       | string              | null: false                     |
| building_name      | string              |                                 |

### Association

- belongs_to :item
- belongs_to :user