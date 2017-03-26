class BotCycle < ActiveRecord::Base
  def self.make(bot_id)
    bot = Bot.find_by(id: bot_id)
    if bot
      Like.make(bot_id)
      puts "like"

      last_records_count = bot.task.message_trakings.where(bot_id: bot.id).order(:created_at).size
      while last_records_count == bot.task.message_trakings.where(bot_id: bot.id).order(:created_at).size do
        eval("Msg" + bot.task.user.id.to_s).make(bot_id)
        puts "message"
      end

      Like.make(bot_id)
      puts "like"

      Com.make(bot_id)
      puts "comment"

      Like.make(bot_id)
      puts "like"

      ResendMessage.make(bot_id)
      puts "resent"

      AcceptRequest.make(bot_id)
      puts "accessept"

      Post.make(bot_id)
      puts "repost"
    end
  end
end