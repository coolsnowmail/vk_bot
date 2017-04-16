require "rails_helper"


RSpec.describe Bot, :type => :model do

  describe 'validations' do
    it { should validate_uniqueness_of(:access_token) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:description) }
    it { should validate_uniqueness_of(:access_token) }
    it { should validate_length_of(:description).is_at_most(18) }
    it { should validate_length_of(:access_token).is_at_least(20).is_at_most(180) }
    it { should belong_to :task }
    it do
      should define_enum_for(:status).with({"Not Active" => 1, "Pending" => 2, "Active" => 3})
    end
  end

  let!(:task) { create(:task) }
  let!(:bot) { create(:bot) }
  let!(:like_traking) { create(:like_traking) }
  let!(:like_traking2) { create(:like_traking) }
  let!(:group) { create(:group) }
  context 'should check offset_change method ' do
    it 'should return 0' do
      task.bots << bot
      expect(bot.offset_change).to eq(0)
    end
    it 'should return 13' do
      task.bots << bot
      task.like_trakings << like_traking
      like_traking.update(bot_id: bot.id)
      expect(bot.offset_change).to eq(13)
    end
  end

  it 'should check if_members_over method' do
    task.groups << group
    task.bots << bot
    task.like_trakings << like_traking
    like_traking.update(bot_id: bot.id)
    bot.if_members_over(1)
    expect(Group.all.size).to eq(0)
  end

  it 'should check check_like_limit method' do
    task.like_trakings << like_traking
    task.bots << bot
    like_traking.update(bot_id: bot.id)
    expect(bot.check_like_limit).to eq(1)
  end

  it 'should check check_if_like_have_maked method' do
    task.groups << group
    task.like_trakings << like_traking
    task.like_trakings << like_traking2
    task.bots << bot
    like_traking.update(bot_id: bot.id)
    like_traking2.update(bot_id: bot.id)
    like_traking.update(vk_group_id: task.groups.first.url.split('/')[3])
    like_traking2.update(vk_group_id: task.groups.first.url.split('/')[3])
    expect(bot.check_if_like_have_maked.size).to eq(2)
  end
end