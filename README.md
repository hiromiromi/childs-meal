# アプリ概要

## アプリケーション名
childs-meal

## アプリケーション概要
幼児のためのバランスが整った食事について、育児に忙しい中簡単に調べることができる

## URL
https://childs-meal.onrender.com

##　テスト用アカウント
- Basic認証ID ： hiromin
- Basic認証パスワード : 2222

## 利用方法
- 食材を検索し、表示された中から好きなレシピを選ぶ（随時レシピ登録中）
- 栄養素ごとに食材を選べる
- 幼児の食事で役立つコラムを閲覧できる（コラム登録中）

## 実装予定の機能
- レシピをお気に入り登録後、ログインすればマイページで確認できる機能
- バランスがいい１食の献立を閲覧できる機能（レシピ登録後実装予定）

## アプリケーションを作成した背景
- 味覚・健康面ともに我が子の今後の食生活の土台となる幼児食だが、離乳食に比べて詳しく掲載されているサイトが少ない。また、幼児期に特に必要な栄養素（鉄分やカルシウム）はよく聞くけど、どんな食材をどのくらい与えれば問題ないのか、私自身毎日調べていたことがあるため。

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/af53995ffd715e0f93265ee2c36373e2.png)](https://gyazo.com/af53995ffd715e0f93265ee2c36373e2)


### usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |

### Association
 - has_many :favorites

### ingredientsテーブル
| Column    | Type   | Options      |
| --------- | ------ | ------------ |
| name      | string | null: false  |
| nutrients | string | null: false  |
| detail    | text   | null: false  |

### Association
 - has_many :recipe_ingredients(中間テーブル)

### recipesテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| dish_name          | string | null: false               |
| material           | text   | null: false               |
| dish_recipe        | text   | null: false               |
| dish_nutrients     | text   | null: false               |

### Association
 - has_many :recipe_ingredients(中間テーブル)
 - has_many :favorites

### columnsテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| title              | string | null: false               |
| news               | text   | null: false               |

### Association
- has_many :favorites

### favoritesテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user_id            | string | null: false, foreign_key: true  |
| column_id          | string | null: false, foreign_key: true  |
| recipe_id          | text   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :column
- belongs_to :recipe

## 開発環境
- Rails 7.0.8.7
- Mysql Ver 14.14