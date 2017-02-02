class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_for_refresh

  helper_method :current_user

  def current_user
    byebug
    @current_user ||= User.find(session[:user_id])
  end

  def check_for_refresh
    if current_token
  end


end