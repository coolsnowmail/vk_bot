require "rails_helper"


RSpec.describe Admin, :type => :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:vk_id) }
    it { should validate_presence_of(:password) }
  end

  context 'should cancel delete of admin' do
    let!(:admin1) { create(:admin) }
    let!(:admin2) { create(:admin) }
    let!(:admin3) { create(:admin) }
    it 'should delete admin' do

      expect(admin1.destroy!).to eq(true)
    end

    # it 'should check check_if_last_admin method' do
    #   admin2.destroy
    #   expect(admin2.present?).to eq(true)
    # end
  end
end