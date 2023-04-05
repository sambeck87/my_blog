class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = ApplicationController.current_user.posts.find(params[:id])
    @like = Like.new
    @like.author = ApplicationController.current_user
    @like.post = @post
    @like.save
    redirect_to user_posts_path(ApplicationController.current_user, @post)
  end
end
