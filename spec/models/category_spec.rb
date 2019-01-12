require 'rails_helper'
require 'shared_examples_for_models'

RSpec.describe Category, type: :model do
  subject { create(:category) }
  
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:name) }

  context 'when name is valid' do
    valid_names = [
      "Be brave stay wild.", "Done is done.",
      "Live to die.", "Pussy riot.", 'AC DC.'
    ]

    it_behaves_like('valid names', valid_names)
  end

  context 'when name is invalid' do
    invalid_names = [
      'hello_world', "Pigs destroyer",
      'Scream.', 'ac dc.', '.*&_!//}{}'
    ]

    it_behaves_like('invalid names', invalid_names)
  end
end
