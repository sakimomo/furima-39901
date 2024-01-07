# README

# テーブル設計

## usersテーブル
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

- has_many :orders
- has_many :items

## itemsテーブル
| Column             | Type       | Options                        | 
| ------------------ | ---------- | -------------------------------|
| title              | string     | null: false, limit: 40         |
| content            | text       | null: false, limit: 1000       |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_day

## addressesテーブル

| Column             | Type       | Options                                  | 
| ------------------ | ---------- | ---------------------------------------- |
| id                 | integer    | primary key                              |
| postal_code        | string     | null: false                              |
| prefecture_id      | string     | null: false                              |
| city               | string     | null: false                              |
| street_address     | string     | null: false                              |
| building_name      | string     |                                          |
| phone_number       | string     | null: false                              |
| purchase           | references | null: false, foreign_key: true           |

- belongs_to_active_hash :prefecture
- belongs_to :order

## ordersテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| id          | integer    | primary key, auto increment    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address