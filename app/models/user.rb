class User < ActiveRecord::Base
  has_secure_password
  belongs_to :admin
  has_one :user_group, dependent: :destroy
  has_one :task, dependent: :destroy

  def like_count
    task.bots.to_a.sum { |bot| bot.like_trakings.size }
  end

  def comment_count
    task.bots.to_a.sum { |bot| bot.comment_trakings.size }
  end

  def message_count
    task.bots.to_a.sum { |bot| bot.message_trakings.size }
  end
end
