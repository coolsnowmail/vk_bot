require 'rails_helper'

RSpec.describe "bots/show", type: :view do
  before(:each) do
    @bot = assign(:bot, Bot.create!(
      :description => "Description",
      :login_vk => "Login Vk",
      :password_vk => "Password Vk",
      :access_token => "Access Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Login Vk/)
    expect(rendered).to match(/Password Vk/)
    expect(rendered).to match(/Access Token/)
  end
end
