# groups for like
class Group < ActiveRecord::Base
  belongs_to :task
  validates :url, presence: true
  # validates :url, format: {
  #   with: %r{https:\/\/vk.com\/[0-9a-z_]+},
  #   message: I18n.t('groups.wrong link')
  # }
  validates :url, numericality: :only_integer
  validates :url, length: { maximum: 40 }
  validates :url, length: { minimum: 5 }
end
