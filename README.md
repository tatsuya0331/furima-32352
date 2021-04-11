# テーブル設計

## usersテーブル （ユーザー情報）

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| address  | string | null: false |

### Association

- has_many :purchases
- has_many :items
- has_one  :residence

## purchases テーブル　（購入記録）

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| product| string     | null: false                    |
### Association

- belongs_to :user

## items テーブル　（商品情報）

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :residence

## residences テーブル　（発送先住所）

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user