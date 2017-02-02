class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from(auth)
    session[:user_id] = user.id
    redirect_to profile_path
  end

  protected

  def auth
    request.env['omniauth.auth']
  end

end