FactoryGirl.define do
  factory :group, class: 'Group' do
    sequence(:url) { |i| "https://vk.com/club#{i}"}
  end
end