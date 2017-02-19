require "rails_helper"

RSpec.describe SuperUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/super_users").to route_to("super_users#index")
    end

    it "routes to #new" do
      expect(:get => "/super_users/new").to route_to("super_users#new")
    end

    it "routes to #show" do
      expect(:get => "/super_users/1").to route_to("super_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/super_users/1/edit").to route_to("super_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/super_users").to route_to("super_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/super_users/1").to route_to("super_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/super_users/1").to route_to("super_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/super_users/1").to route_to("super_users#destroy", :id => "1")
    end

  end
end
