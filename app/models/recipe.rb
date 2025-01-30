class Recipe < ApplicationRecord

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :dish_name, :material, :dish_recipe, :recipe_nutrients, presence: true
end
