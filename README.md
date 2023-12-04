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

- has_many :purchases
- has_many :items

## itemsテーブル
| Column             | Type       | Options                        | 
| ------------------ | ---------- | -------------------------------|
| image              | string     | null: false                    |
| name               | string     | null: false, limit: 40         |
| description        | text       | null: false, limit: 1000       |
| details            | text       |                                |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| shipping_fee       | string     | null: false                    |
| shipping_from      | string     | null: false                    |
| shipping_days      | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user

## addressesテーブル

| Column             | Type       | Options                                  | 
| ------------------ | ---------- | ---------------------------------------- |
| id                 | integer    | primary key                              |
| user  	           | references | foreign_key: true                        |
| item               | references | foreign_key: true                        |
| address            | string     | null: false                              |
| postal_code        | string     | null: false                              |
| prefecture         | string     | null: false                              |
| city               | string     | null: false                              |
| street_address     | string     | null: false                              |
| building_name      | string     |                                          |
| phone_number       | string     | null: false                              |
| card_info          | string     | null: false                              |
| expiration_date    | string     | null: false                              |
| security_code      | string     | null: false                              |

## purchasesテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| id          | integer    | primary key, auto increment    |
| item        | references | foreign_key: true              |
| user        | references | foreign_key: true              |
| purchased_at| datetime   | null: false                    |

- belongs_to :user
