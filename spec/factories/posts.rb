FactoryBot.define do
  factory :post do
    association :category, factory: :category
    name "#{Faker::Food.dish} is perfect."
    content "#{Faker::Food.description}"
    file { "abc" * 100000 }
  end
end
