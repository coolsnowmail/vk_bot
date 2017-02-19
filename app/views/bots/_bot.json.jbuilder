json.extract! bot, :id, :description, :ligin_vk, :password_vk, :access_token, :created_at, :updated_at
json.url bot_url(bot, format: :json)