require 'rails_helper'

RSpec.describe "bots/edit", type: :view do
  before(:each) do
    @bot = assign(:bot, Bot.create!(
      :description => "MyString",
      :ligin_vk => "MyString",
      :password_vk => "MyString",
      :access_token => "MyString"
    ))
  end

  it "renders the edit bot form" do
    render

    assert_select "form[action=?][method=?]", bot_path(@bot), "post" do

      assert_select "input#bot_description[name=?]", "bot[description]"

      assert_select "input#bot_ligin_vk[name=?]", "bot[ligin_vk]"

      assert_select "input#bot_password_vk[name=?]", "bot[password_vk]"

      assert_select "input#bot_access_token[name=?]", "bot[access_token]"
    end
  end
end
