FactoryBot.define do
  factory :post_comment, class: Comment do
    post

    author { "#{Faker::DumbAndDumber.actor}." }
    content { Faker::FamousLastWords.last_words }
  end
end
