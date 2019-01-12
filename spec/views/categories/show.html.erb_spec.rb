require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before do
    @category = create(:category)
    render
  end

  it "renders name attribute in <h3>" do
    assert_select 'h3', @category.name
  end

  it "renders description in <p>" do
    assert_select 'p', @category.description
  end
end
