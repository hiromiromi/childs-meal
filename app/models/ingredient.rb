class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :nutrient

  validates :name, :detail, :nutrient_id , :image , presence: true
  validates :nutrient_id, numericality: { in: 1..5 } , allow_nil: true

  def self.search(search)
    if search != ""
      Ingredient.where('name LIKE(?)', "%#{search}%")
    else
      Ingredient.all
    end
  end
end
