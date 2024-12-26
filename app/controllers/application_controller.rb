class ApplicationController < ActionController::Base
  before_action :current_user

  private

  def current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  helper_method :current_user

  def logged_in?
    @current_user.present?
  end

  helper_method :logged_in?

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Musisz się zalogować, aby kontynuować."
    end
  end
end

