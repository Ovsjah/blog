require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { create(:comment) }

  it { should belong_to(:post) }
  it { should belong_to (:category) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:content) }

  context 'when author is valid' do
    valid_authors = [
      "Ovsjah Bumblebee.",
      "Stinky Wizzleteats.",
      "Edwin Van Der Sar."
    ]

    it_behaves_like('valid names', valid_authors)
  end

  context 'when author is invalid' do
    invalid_authors = [
      "The Great schweinefresser.",
      "spider Man.",
      "van der vaart"
    ]

    it_behaves_like('invalid names', invalid_authors)
  end
end
