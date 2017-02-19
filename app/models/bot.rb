class Bot < ActiveRecord::Base
  has_many :like_trakings, dependent: :destroy
  has_many :message_trakings, dependent: :destroy
  has_many :comment_trakings, dependent: :destroy
end
