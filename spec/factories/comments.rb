FactoryBot.define do
  factory :comment do
    association :category, factory: :category

    author { "Alice Cooper." }
    content { "No More Mr. Nice Guy." }
  end
end
