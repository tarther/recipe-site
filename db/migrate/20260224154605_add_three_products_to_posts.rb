class AddThreeProductsToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :product_1, :string
    add_column :posts, :product_2, :string
    add_column :posts, :product_3, :string
  end
end
