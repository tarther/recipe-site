class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def bookmarked_posts
    @user = User.find(params[:id])
    @posts = @user.bookmarked_posts
  end
end
