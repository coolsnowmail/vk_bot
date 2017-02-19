require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :text => "Text"
      ),
      Message.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
