class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :store
      t.string :category
      t.boolean :status

      t.timestamps
    end
  end
end
