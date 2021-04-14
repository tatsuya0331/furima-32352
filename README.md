# テーブル設計

## usersテーブル （ユーザー情報）

| Column             | Type   | Options                        |
| --------           | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false                    |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |

### Association

- has_many :purchases
- has_many :items

## purchases テーブル　（購入記録）

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item

## items テーブル　（商品情報）

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| product_name | string     | null: false                    |
| description  | string     | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| burden       | string     | null: false                    |
| delivery     | string     | null: false                    |
| days_delivery| string     | null: false                    | 
| price        | integer    | null: false                    |

### Association  

- belongs_to :user
- has_one :purchase
## residences テーブル　（発送先住所）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| card          | integer    | null: false                    |
| expiration    | integer    | null: false                    |
| security      | integer    | null: false                    |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |

### Association

- belongs_to :user