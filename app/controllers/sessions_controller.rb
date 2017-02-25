class SessionsController < ApplicationController
  skip_before_action :authorize_user
  skip_before_action :authorize_admin

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(session[:user_id])
    else
      redirect_to login_url, alert: "Неверная комбинация имени и пароля"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Выход выполнен"
  end
end
