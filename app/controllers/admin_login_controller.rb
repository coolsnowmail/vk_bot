class AdminLoginController < ApplicationController
  skip_before_action :authorize_user
  skip_before_action :authorize_admin

  def new
  end

  def create
    admin = Admin.find_by(name: params[:name])
    if admin and admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_path(session[:admin_id])
    else
      redirect_to admin_login_url, alert: "Неверная комбинация имени и пароля"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to login_url, alert: "Выход выполнен"
  end
end
