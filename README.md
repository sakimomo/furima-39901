# README

# テーブル設計

12/8やる！！！！！！！！！！！！

・プルダウンで選択をする箇所はActiveHash、カラム名、型に規則がある
  →最終課題補足カリキュラム〜カテゴリーの選択を工夫しよう〜

・ER図を修正する

・itemテーブル、addressテーブル（適切な外部キー、都道府県の↑）、purchaseテーブル
   のアソシエーションを追加する、itemとaddressの都道府県を同じカラム名にして使い回す

prefectureのアクティブハッシュ
カテゴリー
商品状態
配送料
発送日時

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
| name               | string     | null: false, limit: 40         |
| description        | text       | null: false, limit: 1000       |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| shipping_fee       | integer    | null: false                    |
| prefecture         | integer    | null: false                    |
| shipping_days      | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_day

## addressesテーブル

| Column             | Type       | Options                                  | 
| ------------------ | ---------- | ---------------------------------------- |
| id                 | integer    | primary key                              |
| postal_code        | integer    | null: false                              |
| prefecture         | string     | null: false                              |
| city               | string     | null: false                              |
| street_address     | string     | null: false                              |
| building_name      | string     |                                          |
| phone_number       | string     | null: false                              |

- belongs_to_active_hash :prefecture

## purchasesテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| id          | integer    | primary key, auto increment    |
| item        | references | foreign_key: true              |
| user        | references | foreign_key: true              |

- belongs_to :user
- belongs_to :item
- belongs_to :addresses
