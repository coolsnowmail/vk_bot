require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :text => "Text"
      ),
      Comment.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
