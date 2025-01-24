FactoryBot.define do
  factory :column do
    title              {Faker::Lorem.sentence}
    news               {Faker::Lorem.sentence}
    column_image       {Faker::Internet.url}
  end
end