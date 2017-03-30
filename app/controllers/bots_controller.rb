class BotsController < ApplicationController
  before_action :set_bot, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize_admin

  def index
    @bots = @current_user.task.bots
    flash[:notice] = t('bots.create a new bot') unless @bots.any?
  end

  def show
  end

  def new
    @bot = Bot.new
  end

  def edit
  end

  def create
    @bot = @current_user.task.bots.build(bot_params)

    respond_to do |format|
      if @bot.save
        format.html { redirect_to @current_user, notice: t('bots.was successfully created') }
        format.js
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @bot.update(bot_params)
        format.html { redirect_to @current_user, notice: t('bots.was successfully updated') }
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @bot.destroy
    respond_to do |format|
      format.html { redirect_to @current_user, notice: t('bots.was successfully destroyed') }
      format.js
    end
  end

  private

    def set_bot
      @bot = Bot.find(params[:id])
    end

    def bot_params
      params.require(:bot).permit(:description, :login_vk, :password_vk, :access_token)
    end
end
