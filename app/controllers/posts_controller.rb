class PostsController < ApplicationController
  def index
    @user = User.eager_load(posts: [:comments]).find(params[:user_id])
    @posts = @user.posts
    render :index
  end

  def show
    @post = Post.eager_load(comments: [:author]).find(params[:id])
    @comments = @post.comments
    render :show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.save
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
