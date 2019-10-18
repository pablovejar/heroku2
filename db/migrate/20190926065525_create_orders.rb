class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :price, :null => false
      t.string :payment, :null => false
      t.string :delivery_address, :null => false
      t.time :delivery_time, :null => false
      t.string :status, :null => false
      t.text :notes

      t.timestamps
    end
  end
end
