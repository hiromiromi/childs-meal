class Nutrient < ActiveHash::Base
  self.data = [
    { id: 1, name: 'carbohydrates', label: '炭水化物' },
    { id: 2, name: 'protein', label: 'たんぱく質' },
    { id: 3, name: 'Lipids', label:'脂質' },
    { id: 4, name: 'vitamin', label: 'ビタミン' },
    { id: 5, name: 'mineral', label: 'ミネラル' },
  ]

  include ActiveHash::Associations
  has_many :ingredients

end