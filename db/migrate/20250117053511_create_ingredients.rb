class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string  :name                   ,null: false
      t.integer :nutrient_id            ,null: false
      t.text    :detail                 ,null: false
      t.text    :image                  ,null: false
      t.timestamps
    end
  end
end
