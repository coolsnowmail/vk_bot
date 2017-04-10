require "rails_helper"

RSpec.describe KeyWordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/key_words").to route_to("key_words#index")
    end

    it "routes to #new" do
      expect(:get => "/key_words/new").to route_to("key_words#new")
    end

    it "routes to #show" do
      expect(:get => "/key_words/1").to route_to("key_words#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/key_words/1/edit").to route_to("key_words#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/key_words").to route_to("key_words#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/key_words/1").to route_to("key_words#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/key_words/1").to route_to("key_words#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/key_words/1").to route_to("key_words#destroy", :id => "1")
    end

  end
end
