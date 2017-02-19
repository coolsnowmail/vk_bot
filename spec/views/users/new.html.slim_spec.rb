require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :login => "MyString",
      :password => "",
      :vk_id => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_login[name=?]", "user[login]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_vk_id[name=?]", "user[vk_id]"
    end
  end
end
