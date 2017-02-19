require 'rails_helper'

RSpec.describe "user_groups/edit", type: :view do
  before(:each) do
    @user_group = assign(:user_group, UserGroup.create!(
      :description => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit user_group form" do
    render

    assert_select "form[action=?][method=?]", user_group_path(@user_group), "post" do

      assert_select "input#user_group_description[name=?]", "user_group[description]"

      assert_select "input#user_group_url[name=?]", "user_group[url]"
    end
  end
end
