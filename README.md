## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |

### Association
 - has_many :favorites

 ## ingredientsテーブル
| Column    | Type   | Options      |
| --------- | ------ | ------------ |
| name      | string | null: false  |
| nutrients | string | null: false  |
| detail    | text   | null: false  |

### Association
 - belongs_to :recipe_ingredients(中間テーブル)

## recipesテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| dish_name          | string | null: false               |
| material           | string | null: false               |
| dish_recipe        | text   | null: false               |
| dish_nutrients     | text   | null: false               |

### Association
 - belongs_to :recipe_ingredients(中間テーブル)
 - has_many :favorites

## columnsテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| title              | string | null: false               |
| news               | text   | null: false               |

### Association
- has_many :favorites

##　favoritesテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user_id            | string | null: false, foreign_key: true  |
| column_id          | string | null: false, foreign_key: true  |
| recipe_id          | text   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :column
- belongs_to :recipe