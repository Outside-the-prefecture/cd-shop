class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
    	t.integer :user_id
    	t.integer :product_id
    	t.integer :number
    	t.integer :tax
    	t.integer :price

      t.timestamps
    end
  end
end
