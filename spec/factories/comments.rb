FactoryBot.define do
  factory :comment do
    association :category, factory: :category
    association :post, factory: :post
    author { "Alice Cooper." }
    content { "No More Mr. Nice Guy." }
  end
end
