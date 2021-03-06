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
        format.html { redirect_to @bot, notice: t('bots.was successfully created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @bot.update(bot_params)
        format.html { redirect_to @bot, notice: t('bots.was successfully updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @bot.destroy
    respond_to do |format|
      format.html { redirect_to bots_url, notice: t('bots.was successfully destroyed') }
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
