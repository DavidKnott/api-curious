class PostsController < ApplicationController
  def index
    @posts = Post.get_posts_for(current_user)
  end

end