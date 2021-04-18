# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |          
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | string     | null: false                    | 
| item_text              | text       | null: false                    | 
| category_id            | integer    | null: false                    | 
| item_state_id          | integer    | null: false                    |
| paying_for_shipping_id | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| shipping_day_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :tags, through: :item_tags
- has_many :item_tags

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| region_id      | integer    | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order


## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## item_tags テーブル

| Column             | Type        | Options                                      |
| ------------------ | ----------- | -------------------------------------------- |
| item               | references  | null: false, foreign_key: true               |
| tag                | references  | null: false, foreign_key: true, unique: true |

### Association

- belongs_to :item
- belongs_to :tag


## tags テーブル

| Column             | Type        | Options                                      |
| ------------------ | ----------- | -------------------------------------------- |
| tag_name           | string      | null: false, unique: true                    |

### Association

- has_many :items, through: :item_tags
- has_many :item_tags


