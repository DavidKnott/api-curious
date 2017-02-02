class ProfileController < ApplicationController
  def show
    @user = current_user.find(session[:user_id])
  end

end