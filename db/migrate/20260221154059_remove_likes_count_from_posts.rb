class RemoveLikesCountFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :likes_count, :integer
  end
end
