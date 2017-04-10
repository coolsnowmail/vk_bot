class KeyWord < ActiveRecord::Base
  belongs_to :message_group
  validates :word, presence: true
end
