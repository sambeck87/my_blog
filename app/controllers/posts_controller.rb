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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = ApplicationController.current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to user_posts_path(ApplicationController.current_user), notice: "El post se creó correctamente."
    else
     redirect_to user_posts_path, notice: "El post NO se creó correctamente."
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
