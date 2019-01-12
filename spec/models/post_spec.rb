require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { create(:post) }

  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }

  context "when file has valid size" do
    it { expect(subject).to be_valid }
  end

  context "when file is invalid" do
    it "has size more than 2 megabytes" do
      subject.file = 'abc' * 1000000
      expect(subject).not_to be_valid
    end
  end

  context 'when name is valid' do
    valid_names = [
      "Rain Forest and it's Creatures.",
      "Panthers and Jaguars of South America.",
      "Deserts of the World."
    ]

    it_behaves_like('valid names', valid_names)
  end

  context 'when name is invalid' do
    invalid_names = [
      "scumbag Full of Lies.",
      "Whistle Blower", "Asylum."
    ]

    it_behaves_like('invalid names', invalid_names)
  end
end
