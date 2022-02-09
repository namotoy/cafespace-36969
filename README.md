# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| prefecture_id      | integer             | null: false               |
| city               | string              | null: false               |

### Association

* has_many :cafeworks
* has_many :comments

## cafeworks table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| shop_name          | string     | null: false                    |
| catch_copy         | text       | null: false                    |
| feature            | text       | null: false                    |
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
| cafework    | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :cafework
- belongs_to :user