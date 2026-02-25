class RemoveIngredientsFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :ingredients, :text
  end
end
