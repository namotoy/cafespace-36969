# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| prefecture_id      | integer             | null: false               |
| city               | string              | null: false               |

### Association

* has_many :cafetypes
* has_many :comments

## cafes table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| shop_name          | string     | null: false                    |
| catch_copy         | text       | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| block_number       | string     | null: false                    |
| wifi               | integer    | null: false                    |
| power_supply       | integer    | null: false                    |
| capacity           | integer    | null: false                    |
| toilet_place       | integer    | null: false                    |
| cafe_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| cafe        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :cafetype
- belongs_to :user