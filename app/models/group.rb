class Group < ActiveRecord::Base
  belongs_to :task
  validates :url, presence: true
end
