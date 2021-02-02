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
| birthday　　　　　　 | date    | null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    | 
| product_text        | text       | null: false                    | 
| category            | string     | null: false                    | 
| product_state       | string     | null: false                    |
| paying_for_shipping | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| shipping_day        | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| region         | string  | null: false |
| city           | string  | null: false |
| address_line_1 | string  | null: false |
| address_line_2 | string  |             |
| phone_number   | string  | null: false |

### Association

- has_many :purchases

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |
| address        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :address