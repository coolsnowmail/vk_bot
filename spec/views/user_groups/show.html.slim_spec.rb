require 'rails_helper'

RSpec.describe "user_groups/show", type: :view do
  before(:each) do
    @user_group = assign(:user_group, UserGroup.create!(
      :description => "Description",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Url/)
  end
end
