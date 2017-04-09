class Group < ActiveRecord::Base
  belongs_to :task
  validates :url, presence: true
  validates :url, format: { with: /a/,
    message: "only allows letters" }
end
