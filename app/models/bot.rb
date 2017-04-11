class Bot < ActiveRecord::Base
  belongs_to :task
  enum status: {"Not Active" => 1, "Pending" => 2, "Active" => 3}
  validates :status, inclusion: {in: Bot.statuses.keys}
  validates :description, presence: true
  validates :description, uniqueness: true
  validates :access_token, uniqueness: true
  validates :description, length: { maximum: 18 }
  validates :access_token, length: { in: 20..180 }


  def offset_change
    last_like_traking = task.like_trakings.order(created_at: :desc).first
    if last_like_traking
      last_like_traking.offset + 1
    else
      return 0
    end
  end

  def if_members_over(members_count)
    task.groups.first.destroy if task.like_trakings.where(bot_id: id).count >= members_count
  end

  def check_like_limit
    task.like_trakings.where('vk_user_status = ? AND bot_id = ? AND created_at BETWEEN ? AND ?', 1, id, Time.zone.now.beginning_of_day,
      Time.zone.now.end_of_day).size
  end

  def check_if_like_have_maked
    bot_like_trakings = task.like_trakings.where(vk_group_id: task.groups.first.url.split('/')[3])
    bot_like_vk_id_today = []
    bot_like_trakings.each do |like_traking|
      bot_like_vk_id_today.push(like_traking.vk_user_id)
    end
    return bot_like_vk_id_today
  end

  def check_if_message_have_maked
    bot_message_trakings = task.message_trakings
    bot_message_vk_user_ids = []
    bot_message_trakings.each do |i|
      bot_message_vk_user_ids.push(i.vk_user_id)
    end
    return bot_message_vk_user_ids
  end

  def check_message_limit
    task.message_trakings.where('bot_id = ? AND created_at BETWEEN ? AND ?', id, Time.zone.now.beginning_of_day,
      Time.zone.now.end_of_day).size
  end

  def check_com_limit
    task.comment_trakings.where('bot_id = ? AND created_at BETWEEN ? AND ?', id, Time.zone.now.beginning_of_day,
      Time.zone.now.end_of_day).size
  end

  def if_members_for_messsage_send_over(members_count)
    if task.message_offset >= members_count
      task.update(message_offset: 0)
    end
  end
end
