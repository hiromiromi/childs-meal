class Recipe < ApplicationRecord

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :favorites, dependent: :destroy

  validates :dish_name, :material, :dish_recipe, :recipe_nutrients, presence: true
end
