class PostsController < ApplicationController
  def index
    @posts = Post.get_posts_for(current_user, params[:q])
  end

  def show
    @post, @comments =  Comment.get_post_and_comments_for(params[:permalink], current_user)
  end

end