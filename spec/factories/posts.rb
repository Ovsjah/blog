FILES = %w[
  arabica_beans black_coffee_beans coffee
  coffee_beans gourmet_coffee_beans green_coffee
  java_coffee light_coffee_beans
  roasted_coffee_beans robusta_beans
]

FactoryBot.define do
  factory :post do
    category
    name { "#{Faker::Coffee.blend_name} coffee blend." }
    content { "#{Faker::Coffee.notes.capitalize}." }

    trait :with_file do
      file do
        fixture_file_upload(Rails.root.join('spec', 'assets', "#{FILES.pop}.jpeg"))
      end
    end
  end
end
