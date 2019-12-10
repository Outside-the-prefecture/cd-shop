class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
    	t.string :last_name
    	t.string :first_name
    	t.string :kana_last_name
    	t.string :kana_first_name
    	t.string :mail
    	t.string :postal_code
    	t.string :phone_number
    	t.string :adddress
    	t.string :password
    	t.string :password_confimation
    	t.boolean :is_deleted

      t.timestamps
    end
  end
end
