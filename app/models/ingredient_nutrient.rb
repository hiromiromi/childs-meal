class Ingredient_nutrient < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '炭水化物' },
    { id: 3, name: 'タンパク質' },
    { id: 4, name: '脂質' },
    { id: 5, name: 'ビタミン' },
    { id: 6, name: 'ミネラル' },
  ]

  include ActiveHash::Associations
  has_many :ingredients

end