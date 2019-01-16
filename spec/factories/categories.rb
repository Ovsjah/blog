FactoryBot.define do
  factory :category do
    name { "#{Faker::Coffee.origin} origin." }
    description { "Variety: #{Faker::Coffee.variety}. Effect: #{Faker::Coffee.intensifier}" }
  end
end
