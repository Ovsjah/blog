FactoryBot.define do
  factory :comment do
    category

    author { "#{Faker::FunnyName.two_word_name}." }
    content { Faker::GreekPhilosophers.quote }
  end
end
