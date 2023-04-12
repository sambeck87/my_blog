class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user
    @comment.save
    redirect_to user_posts_path(current_user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
