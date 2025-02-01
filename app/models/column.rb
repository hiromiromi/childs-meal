class Column < ApplicationRecord
  has_many :favorites, dependent: :destroy
  
  validates :title, :news, presence: true
end
