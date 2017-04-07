class UserGroup < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true
  validates :url, presence: true
end
