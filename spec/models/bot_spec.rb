require "rails_helper"


RSpec.describe Bot, :type => :model do

  describe 'validations' do
    it { should validate_presence_of(:access_token) }
    it { should validate_uniqueness_of(:access_token) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:description) }
    it do
      should define_enum_for(:status).with({"Not Active" => 1, "Pending" => 2, "Active" => 3})
    end
  end

  # context 'should cancel delete of admin' do
  #   let!(:task) { create(:task) }
  #   it 'should delete admin' do
  #     expect(task).to eq(true)
  #   end
  # end

    # it 'should check to not alow delete admin if admins <= 2' do
    #   admin1.destroy
    #   admin2.destroy
    #   expect(Admin.all.size).to eq(2)
    # end
  # end
end