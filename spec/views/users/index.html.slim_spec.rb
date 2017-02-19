require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :login => "Login",
        :password => "",
        :vk_id => "Vk"
      ),
      User.create!(
        :login => "Login",
        :password => "",
        :vk_id => "Vk"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Vk".to_s, :count => 2
  end
end
