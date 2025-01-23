class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string  :dish_name    ,null: false
      t.text    :material     ,null: false
      t.text    :dish_recipe  ,null: false
      t.text    :recipe_nutrients  ,null: false
      t.text    :recipe_image
      t.timestamps
    end
  end
end
