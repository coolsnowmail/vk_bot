require 'rails_helper'

RSpec.describe "bots/new", type: :view do
  before(:each) do
    assign(:bot, Bot.new(
      :description => "MyString",
      :login_vk => "MyString",
      :password_vk => "MyString",
      :access_token => "MyString"
    ))
  end

  it "renders new bot form" do
    render

    assert_select "form[action=?][method=?]", bots_path, "post" do

      assert_select "input#bot_description[name=?]", "bot[description]"

      assert_select "input#bot_login_vk[name=?]", "bot[login_vk]"

      assert_select "input#bot_password_vk[name=?]", "bot[password_vk]"

      assert_select "input#bot_access_token[name=?]", "bot[access_token]"
    end
  end
end
