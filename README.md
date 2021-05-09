# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

<<<<<<< Updated upstream
* System dependencies
=======
## purchases テーブル （購入記録）
>>>>>>> Stashed changes

* Configuration

* Database creation

<<<<<<< Updated upstream
* Database initialization
=======
## items テーブル （商品情報）
>>>>>>> Stashed changes

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

<<<<<<< Updated upstream
* ...
=======
## residences テーブル （発送先住所）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| delivery _id  | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :purchase
>>>>>>> Stashed changes
