require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { create(:post, :with_file) }

  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }

  context "when file has valid size" do
    it { expect(subject).to be_valid }
  end

  context "when file size is invalid" do
    let(:invalid_post) { build(:invalid_post, :with_file) }

    it "fails validation" do
      expect(invalid_post).not_to be_valid
      expect(invalid_post.errors[:file]).to include("is over 2Mb")
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
