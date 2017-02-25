class Admin < ActiveRecord::Base
  has_secure_password
  has_many :users
  validates :name, :vk_id, :password, presence: true
  before_destroy :check_if_last_admin

  def check_if_last_admin
    return false if Admin.all.size <= 1
  end
end
