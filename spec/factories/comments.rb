FactoryBot.define do
  factory :comment do
    association :category, factory: :category
    association :post, factory: :post
    author "#{Faker::FunnyName.two_word_name}."
    content "#{Faker::GreekPhilosophers.quote}!"
  end
end
