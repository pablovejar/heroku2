class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name, :null => false
      t.float :price, :null => false
      t.text :description
      t.integer :quantity
      t.float :rating

      t.timestamps
    end
  end
end
