class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize_user
  before_action :authorize_admin

  protected
    def authorize_user
      @current_user = User.find_by(id: session[:user_id])
      unless @current_user
      redirect_to login_url, alert: "Пожалуйста, пройдите авторитезацию"
    end

    def authorize_admin
      @current_admin = Admin.find_by(id: session[:admin_id])
      unless @current_admin
        redirect_to login_url, alert: "Пожалуйста, пройдите авторитезацию"
      end
    end

  end
end
