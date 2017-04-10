require 'rails_helper'

RSpec.describe "key_words/new", type: :view do
  before(:each) do
    assign(:key_word, KeyWord.new(
      :word => "MyString"
    ))
  end

  it "renders new key_word form" do
    render

    assert_select "form[action=?][method=?]", key_words_path, "post" do

      assert_select "input#key_word_word[name=?]", "key_word[word]"
    end
  end
end
