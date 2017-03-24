FactoryGirl.define do
    factory :user, class: 'User' do
      sequence(:login_vk) { |i| "login_vk#{i}"}
      sequence(:vk_id) { |i| "vk_id#{i}"}
      password '123'
      password_confirmation '123'
    end
end