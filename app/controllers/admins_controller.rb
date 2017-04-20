class AdminsController < ApplicationController
  before_action :set_admin, only: [:show]
  skip_before_action :authorize_user

  def show
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end
end
