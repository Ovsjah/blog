FactoryBot.define do
  factory :post do
    association :category, factory: :category
    name "Tropic Forest."
    content "Adventurers should be careful in jungles."
    file { "abc" * 100000 }
  end
end
