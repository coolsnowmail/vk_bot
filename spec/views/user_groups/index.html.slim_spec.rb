require 'rails_helper'

RSpec.describe "user_groups/index", type: :view do
  before(:each) do
    assign(:user_groups, [
      UserGroup.create!(
        :description => "Description",
        :url => "Url"
      ),
      UserGroup.create!(
        :description => "Description",
        :url => "Url"
      )
    ])
  end

  it "renders a list of user_groups" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
