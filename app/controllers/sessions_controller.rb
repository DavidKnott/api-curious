class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to profile_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end