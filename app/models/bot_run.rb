class BotRun < ActiveRecord::Base
  def self.make
    Bot.all.each do |bot|
      BotCycle.make(bot.id)
      sleep 120
    end
  end
end