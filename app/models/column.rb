class Column < ApplicationRecord
  validates :title, :news, presence: true
end
