class ActivateBotController < ApplicationController
  skip_before_action :authorize_admin
  def activate
    bot = Bot.find_by(id: params[:bot_id])
    return redirect_to user_path(@current_user), notice: t("bots.params error") unless bot
    return redirect_to user_path(@current_user), notice: t('enter group for messages') unless bot.task.message_group
    return redirect_to user_path(@current_user), notice: t('enter key words') unless bot.task.message_group.key_words.any?
    uri = URI.parse("https://api.vk.com/method/groups.get")
    response = Net::HTTP.post_form(uri, {
        "offset" => 0,
        "extended" => 1,
        "count" => 1000,
        "access_token" => bot.access_token,
        "v" => "5.62"})
    bot_piar_groups = JSON.parse(response.body)
    return redirect_to user_path(@current_user), notice: t("bots.access token error") unless bot_piar_groups["response"]
    if bot_piar_groups["response"]
       if bot.update(status: 3)
         redirect_to user_path(@current_user), notice: t("bots.bot activated")
       else
         redirect_to user_path(@current_user), notice: t("bots.activate error")
       end
    end
  end
end
