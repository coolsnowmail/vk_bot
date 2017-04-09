class MessageGroup < ActiveRecord::Base
  belongs_to :task
  has_many :key_words, dependent: :destroy
  validates :vk_id, presence: true
  validates :name, presence: true
  validates :vk_id, length: { maximum: 30 }
  validates :name, length: { maximum: 50 }
end
