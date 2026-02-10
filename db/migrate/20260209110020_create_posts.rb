class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.text :steps
      t.integer :likes_count
      t.string :store
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
