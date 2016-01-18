class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :title
    	t.float :price
    	t.string :isbn
    	t.integer :quantity

      t.timestamps null: false
    end
  end
end
