class PostsController < ApplicationController
  def index
    @posts, @rules = Post.get_posts_and_rules_for(current_user, params[:q])
  end

  def show
    @post, @comments =  Comment.get_post_and_comments_for(params[:permalink], current_user)
  end

end