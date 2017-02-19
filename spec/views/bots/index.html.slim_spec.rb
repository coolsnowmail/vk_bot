require 'rails_helper'

RSpec.describe "bots/index", type: :view do
  before(:each) do
    assign(:bots, [
      Bot.create!(
        :description => "Description",
        :ligin_vk => "Ligin Vk",
        :password_vk => "Password Vk",
        :access_token => "Access Token"
      ),
      Bot.create!(
        :description => "Description",
        :ligin_vk => "Ligin Vk",
        :password_vk => "Password Vk",
        :access_token => "Access Token"
      )
    ])
  end

  it "renders a list of bots" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Ligin Vk".to_s, :count => 2
    assert_select "tr>td", :text => "Password Vk".to_s, :count => 2
    assert_select "tr>td", :text => "Access Token".to_s, :count => 2
  end
end
