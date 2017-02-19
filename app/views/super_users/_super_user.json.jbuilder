json.extract! super_user, :id, :login, :vk_id, :created_at, :updated_at
json.url super_user_url(super_user, format: :json)