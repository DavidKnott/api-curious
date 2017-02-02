class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_for_refresh

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def check_for_refresh
    conn = Faraday.new
    conn.headers['Authorization'] = "bearer #{current_user.token}"
    response = conn.get "https://oauth.reddit.com/api/v1/me"
    if response.status == 401
      conn = Faraday.new 
      conn.basic_auth(ENV["REDDIT_KEY"], ENV["REDDIT_SECRET"])
      conn.params = {"grant_type" => "refresh_token", "refresh_token" => "#{current_user.refresh_token}"}
      response = conn.post "https://www.reddit.com/api/v1/access_token"
      response = JSON.parse(response.body)
      current_user.refresh(response.body)
    end
  end


end