require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:category) { create(:category) }

  let(:valid_attributes) {
    {author: "Alice Cooper.",
     content: "And here I am."}
  }

  let(:invalid_attributes) {
    {author: "#{Faker::Beer.name.downcase}",
     content: Faker::Beer.style}
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {category_id: category.id, comment: valid_attributes}
        }.to change(Comment, :count).by(1)
      end
    end

    context "with invalid params" do
      it "doesn't create a new Comment" do
        expect {
          post :create, params: {category_id: category.id, comment: invalid_attributes}
        }.not_to change(Comment, :count)
      end
    end
  end
end
