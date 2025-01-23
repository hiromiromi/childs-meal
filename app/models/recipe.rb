class Recipe < ApplicationRecord

  validates :dish_name, :material, :dish_recipe, :recipe_nutrients, presence: true
end
