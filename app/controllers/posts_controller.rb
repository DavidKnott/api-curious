class PostsController < ApplicationController
  def index
    @posts = Post.get_most_recent_for(current_user)
  end

end