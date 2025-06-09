class ApplicationController < ActionController::Base
  before_action :current_user
  helper_method :current_user, :logged_in?

  def current_user
    puts "------------------ code before every request ------------------"
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to login_path unless logged_in?
  end
end