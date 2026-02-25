class RemoveDescriptionFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :description, :text
  end
end
