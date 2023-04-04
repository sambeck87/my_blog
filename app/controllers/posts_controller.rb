class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render :index
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    render :show
  end
end
