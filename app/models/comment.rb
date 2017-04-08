class Comment < ActiveRecord::Base
  belongs_to :task
    validates :text, presence: true
    validates :text, length: { maximum: 500 }
end
