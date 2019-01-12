FactoryBot.define do
  factory :comment do
    association :category, factory: :category
    association :post, factory: :post
    author "Ovsjah Bumblebee."
    content "Nicely selected category!"
  end
end
