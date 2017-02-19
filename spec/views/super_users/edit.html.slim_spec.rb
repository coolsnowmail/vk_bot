require 'rails_helper'

RSpec.describe "super_users/edit", type: :view do
  before(:each) do
    @super_user = assign(:super_user, SuperUser.create!(
      :login => "MyString",
      :password => "",
      :vk_id => "MyString"
    ))
  end

  it "renders the edit super_user form" do
    render

    assert_select "form[action=?][method=?]", super_user_path(@super_user), "post" do

      assert_select "input#super_user_login[name=?]", "super_user[login]"

      assert_select "input#super_user_password[name=?]", "super_user[password]"

      assert_select "input#super_user_vk_id[name=?]", "super_user[vk_id]"
    end
  end
end
