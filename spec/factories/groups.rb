FactoryGirl.define do
  factory :group, class: 'Group' do
    sequence(:url) { |i| "https://vk.com/club100000#{i}"}
  end
end