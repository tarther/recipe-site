class RemoveCommentsCountFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :comments_count, :integer
  end
end
