class User < ActiveRecord::Base
  has_secure_password
  belongs_to :super_user
  has_many :tasks, dependent: :destroy
  has_many :user_groups, dependent: :destroy
end
