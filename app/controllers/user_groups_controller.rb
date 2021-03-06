class UserGroupsController < ApplicationController
  before_action :set_user_group, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize_admin

  def show
  end

  def new
    @user_group = UserGroup.new
  end

  def edit
  end

  def create
    @user_group = @current_user.build_user_group(user_group_params)

    respond_to do |format|
      if @user_group.save
        format.html { redirect_to user_url(@current_user.id), notice: t('user_groups.successfully created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @current_user.user_group.update(user_group_params)
        format.html { redirect_to user_url(@current_user.id), notice: t('user_groups.successfully updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user_group.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@current_user.id), notice: t('user_groups.successfully destroyed') }
    end
  end

  private
    def set_user_group
      @user_group = UserGroup.find(params[:id])
    end

    def user_group_params
      params.require(:user_group).permit(:description, :url)
    end
end
