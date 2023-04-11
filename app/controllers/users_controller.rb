class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
  end
end
