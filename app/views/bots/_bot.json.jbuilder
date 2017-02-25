json.extract! bot, :id, :description, :login_vk, :password_vk, :access_token, :created_at, :updated_at
json.url bot_url(bot, format: :json)