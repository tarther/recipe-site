class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @bookmark = @post.bookmarks.new(user: current_user)
    if @bookmark.save
      redirect_back(fallback_location: posts_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = @post.bookmarks.find_by(user: current_user)
    @bookmark.destroy
    redirect_back(fallback_location: posts_path)
  end
end
