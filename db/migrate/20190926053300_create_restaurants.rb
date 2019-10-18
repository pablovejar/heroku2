class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :mail, :null => false
      t.string :address, :null => false
      t.float :rating
      t.string :phone, :null => false

      t.timestamps
    end
  end
end
