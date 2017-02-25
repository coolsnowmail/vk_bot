class MessageGroup < ActiveRecord::Base
  belongs_to :task
  has_many :key_words, dependent: :destroy
  validates :vk_id, presence: true
  validates :name, presence: true
  validates :vk_id, length: { maximum: 30 }
  validates :name, length: { maximum: 50 }

  def get_key_words
    words = []
    key_words.each {|key_word| words.push(key_word.word)}
    return words
  end
end
