FactoryBot.define do
  factory :invalid_post, class: Post do
    association :category, factory: :category
    name { "White Fang is perfect." }
    content { "Was written by Jack London." }

    trait :with_file do
      file { fixture_file_upload(Rails.root.join('spec', 'assets', 'invalid_file.png')) }
    end
  end
end
