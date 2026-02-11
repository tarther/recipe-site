class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, except: [:posts]

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

  private
  def ensure_correct_user
    @user = User.find(params[:id])
    redirect_to posts_path unless @user == current_user
  end
end
