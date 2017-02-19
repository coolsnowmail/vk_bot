class Task < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :bots, dependent: :destroy
end
