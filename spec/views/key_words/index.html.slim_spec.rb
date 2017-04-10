require 'rails_helper'

RSpec.describe "key_words/index", type: :view do
  before(:each) do
    assign(:key_words, [
      KeyWord.create!(
        :word => "Word"
      ),
      KeyWord.create!(
        :word => "Word"
      )
    ])
  end

  it "renders a list of key_words" do
    render
    assert_select "tr>td", :text => "Word".to_s, :count => 2
  end
end
