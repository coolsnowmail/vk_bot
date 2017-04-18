require "rails_helper"

RSpec.describe Group, :type => :model do

  describe 'validations' do
    it { should belong_to :task }
    it { should validate_length_of(:url).is_at_least(19).is_at_most(40) }
    it { should validate_presence_of(:url) }
    it { should allow_value('https://vk.com/vpisssska12').for(:url) }
    it { should_not allow_value('htts://vk.com/vpisssska').for(:url) }
    it { should_not allow_value('https://vk.co/vpisssska').for(:url) }
    it { should_not allow_value('https://vk.co/vpisssska?').for(:url) }
    it { should_not allow_value('https://vk.co/vpisssska  dsd').for(:url) }
  end
end