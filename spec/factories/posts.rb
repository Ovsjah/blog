FactoryBot.define do
  factory :post do
    association :category, factory: :category
    name { "Borsch and a loaf of bread." }
    content { "Soup with meat and beetroots" }

    trait :with_file do
      file { fixture_file_upload(Rails.root.join('spec', 'assets', 'arabica_beans.jpeg')) }
    end
  end
end
