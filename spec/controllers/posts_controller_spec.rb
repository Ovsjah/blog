require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:category) { create(:category) }

  let(:valid_attributes) {
    {name: "#{Faker::Coffee.blend_name} coffee.",
     content: "#{Faker::Coffee.notes.capitalize}.", category_id: category.id}
  }

  let(:invalid_attributes) {
    {name: "#{Faker::Beer.name.downcase}",
     content: Faker::Beer.style, category_id: category.id}
  }

  describe "GET #show" do
    it "returns a success response" do
      post = Post.create! valid_attributes
      get :show, params: {id: post.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      post = Post.create! valid_attributes
      get :edit, params: {id: post.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created Post" do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {post: invalid_attributes}
        expect(response).to be_successful
      end

      it "doesn't create a new Post" do
        expect {
          post :create, params: {post: invalid_attributes}
        }.not_to change(Post, :count)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "#{Faker::Coffee.blend_name} coffee.",
         content: "#{Faker::Coffee.notes.capitalize}.", category_id: category.id}
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: new_attributes}
        post.reload
        expect(post.name).to eq(new_attributes[:name])
        expect(post.content).to eq(new_attributes[:content])
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      before do
        @post = Post.create! valid_attributes
        put :update, params: {id: @post.to_param, post: invalid_attributes}
      end

      it "returns a success response (i.e. to display the 'edit' template)" do
        expect(response).to be_successful
      end

      it "doesn't update the post" do
        expect(@post.name).not_to eq(invalid_attributes[:name])
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: {id: post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the categories list" do
      post = Post.create! valid_attributes
      delete :destroy, params: {id: post.to_param}
      expect(response).to redirect_to(category)
    end
  end
end
