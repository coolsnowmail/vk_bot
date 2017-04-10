require 'rails_helper'

RSpec.describe "key_words/edit", type: :view do
  before(:each) do
    @key_word = assign(:key_word, KeyWord.create!(
      :word => "MyString"
    ))
  end

  it "renders the edit key_word form" do
    render

    assert_select "form[action=?][method=?]", key_word_path(@key_word), "post" do

      assert_select "input#key_word_word[name=?]", "key_word[word]"
    end
  end
end
