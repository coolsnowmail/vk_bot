class Group < ActiveRecord::Base
  belongs_to :task
  validates :url, presence: true
  validates :url, format: { with: /https:\/\/vk.com\/[0-9a-z_]{4,}/,
    message: I18n.t('groups.wrong link') }
  validates :url, length: { maximum: 40 }
  validates :url, length: { minimum: 19 }
end
