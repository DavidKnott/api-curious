class PostsController < ApplicationController
  def index
    @posts = Post.get_posts_for(current_user)
  end

  def show
    @comments = Comment.get_comments_for(params[:permalink], current_user)
  end

end