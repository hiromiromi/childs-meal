class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe, optional: true
  belongs_to :column, optional: true

  validates :recipe_id, uniqueness: { scope: :user_id }, if: -> { recipe_id.present? }
  validates :column_id, uniqueness: { scope: :user_id }, if: -> { column_id.present? }
end
