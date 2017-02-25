class User < ActiveRecord::Base
  has_secure_password
  belongs_to :admin
  has_one :user_group, dependent: :destroy
  has_one :task, dependent: :destroy
  validates :name, :password, :vk_id, presence: true

  def like_count
    task.like_trakings.size
  end

  def comment_count
    task.comment_trakings.size
  end

  def message_count
    task.message_trakings.size
  end
end
