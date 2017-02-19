require 'rails_helper'

RSpec.describe "user_groups/new", type: :view do
  before(:each) do
    assign(:user_group, UserGroup.new(
      :description => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new user_group form" do
    render

    assert_select "form[action=?][method=?]", user_groups_path, "post" do

      assert_select "input#user_group_description[name=?]", "user_group[description]"

      assert_select "input#user_group_url[name=?]", "user_group[url]"
    end
  end
end
