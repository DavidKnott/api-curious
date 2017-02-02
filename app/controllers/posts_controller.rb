class PostsController < ApplicationController
  def index
    @posts = current_user.get_most_recent
  end

end