class Favorite < ApplicationRecord
  belongs_to :user   
  belongs_to :recipe   
  belongs_to :column

  validates_uniqueness_of :recipe_id, :column_id, scope: :user_id
end
