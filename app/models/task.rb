class Task < ActiveRecord::Base
  belongs_to :user
  has_many :like_trakings, dependent: :destroy
  has_many :message_trakings, dependent: :destroy
  has_many :comment_trakings, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :bots, dependent: :destroy
  validates :description, presence: true

  def any_active_bot?
    if bots.any?
      bots.where(status: 3).any?
    else
      false
    end
  end
end
