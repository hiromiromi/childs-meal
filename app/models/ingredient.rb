class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ingredient_nutrient

  validates :name, :detail, presence: true
  validates :ingredient_nutrient_id, numericality: { other_than: 1 , message: "can't be blank"}
end
