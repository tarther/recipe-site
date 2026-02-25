class AddOtherIngredientsToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :other_ingredients, :string, array: true, default: []
  end
end
