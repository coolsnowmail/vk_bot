class GroupMessagerController < ApplicationController
  skip_before_action :authorize_admin
  before_action :set_message_group, only: [:edit, :update]

  # def key_word_create
  #   #
  # end


  # def message_group_create
  #   @message_group = @current_user.task.build_message_group(name: params[:name], vk_id: params[:vk_id])
  #   @message_group.save
  #   puts @message_group.errors.full_messages
  #   respond_to do |format|
  #     format.js
  #   end
  # end


  def new
    @message_group = MessageGroup.new
  end

  def edit
  end

  def create
    @message_group = @current_user.task.build_message_group(message_group_params)

    respond_to do |format|
      @message_group.save
      format.js
    end
  end

  def update
    respond_to do |format|
      @message_group.update(message_group_params)
      format.js
    end
  end

  private
    def set_message_group
      @message_group = MessageGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_group_params
      params.require(:message_group).permit(:name, :vk_id)
    end
end
