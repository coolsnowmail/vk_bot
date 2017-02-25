class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update]
  skip_before_action :authorize_user

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :password, :password_confirmation, :vk_id)
    end
end
