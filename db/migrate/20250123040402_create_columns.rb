class CreateColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :columns do |t|
      t.string :title         ,null: false
      t.text   :news          ,null: false
      t.text   :column_image  ,null: false
      t.timestamps
    end
  end
end
