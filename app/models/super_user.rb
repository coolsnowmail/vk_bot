class SuperUser < ActiveRecord::Base
  has_secure_password
  has_many :users
end
