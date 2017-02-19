require 'rails_helper'

RSpec.describe "SuperUsers", type: :request do
  describe "GET /super_users" do
    it "works! (now write some real specs)" do
      get super_users_path
      expect(response).to have_http_status(200)
    end
  end
end
