require "rails_helper"


RSpec.describe Admin, :type => :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:vk_id) }
    it { should validate_presence_of(:password) }
  end
end