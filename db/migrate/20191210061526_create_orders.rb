class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :payment_method
    	t.string :postal_code
    	t.integer :user_id
    	t.string :last_name
    	t.string :first_name
    	t.string :kana_last_name
    	t.string :kana_first_name
    	t.string :mail
    	t.string :phone_number
    	t.integer :shipping_fee
    	t.integer :total_amount
    	t.string :delivery_target_address

      t.timestamps
    end
  end
end
