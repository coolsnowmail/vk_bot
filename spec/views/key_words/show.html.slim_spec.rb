require 'rails_helper'

RSpec.describe "key_words/show", type: :view do
  before(:each) do
    @key_word = assign(:key_word, KeyWord.create!(
      :word => "Word"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word/)
  end
end
