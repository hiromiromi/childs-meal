class Ingredient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :nutrient

  validates :name, :detail, presence: true
  validates :nutrient_id, numericality: { other_than: 1 , message: "can't be blank"}

  def self.search(search)
    if search != ""
      Ingredient.where('name LIKE(?)', "%#{search}%")
    else
      Ingredient.all
    end
  end
end
