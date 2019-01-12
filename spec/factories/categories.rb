FactoryBot.define do
  factory :category do
    name "#{Faker::Coffee.blend_name} coffee."
    description "#{Faker::Coffee.notes.capitalize}."
  end
end
