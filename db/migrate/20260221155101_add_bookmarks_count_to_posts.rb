class AddBookmarksCountToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :bookmarks_count, :integer, default: 0
  end
end
