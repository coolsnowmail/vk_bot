class ActivateBotController < ApplicationController
  skip_before_action :authorize_admin
  def activate
    bot = Bot.find_by(id: params[:bot_id])
    if bot
      if bot.status.present?
        uri = URI.parse("https://api.vk.com/method/groups.get")
        response = Net::HTTP.post_form(uri, {
            "offset" => 0,
            "extended" => 1,
            "count" => 1000,
            "access_token" => bot.access_token,
            "v" => "5.62"})
        bot_piar_groups = JSON.parse(response.body)
        if bot_piar_groups["response"]
          # bot.status = 3
          # respond_to do |format|
          #   if bot.save
          #     format.html { redirect_to groups_path, notice: t('groups.was successfully created') }
          #   else
          #     format.html { render :new }
          #   end
          # end


           if bot.update(status: 3)
             redirect_to user_path(@current_user), notice: t("bots.bot activated")
           else
             redirect_to user_path(@current_user), notice: t("bots.activate error")
           end





         else
           redirect_to user_path(@current_user), notice: t("bots.access token error")
         end
      end
    else
      redirect_to user_path(@current_user), notice: t("bots.params error")
    end
  end
end
