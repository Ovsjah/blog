require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = create(:category)
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post"
  end
end
