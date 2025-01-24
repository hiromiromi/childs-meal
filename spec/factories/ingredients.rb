FactoryBot.define do
  factory :ingredient do
    name              {Faker::Food.ingredient}
    nutrient_id       {Faker::Number.between(from: 1, to: 5)}
    detail            {Faker::Lorem.sentence}
    image             {Faker::Internet.url}
  end
end
