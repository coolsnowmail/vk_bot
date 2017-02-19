require 'rails_helper'

RSpec.describe "super_users/show", type: :view do
  before(:each) do
    @super_user = assign(:super_user, SuperUser.create!(
      :login => "Login",
      :password => "",
      :vk_id => "Vk"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Login/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Vk/)
  end
end
