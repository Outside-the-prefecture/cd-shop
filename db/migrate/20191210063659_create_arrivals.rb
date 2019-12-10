class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
    	t.integer :cd_id
    	t.integer :count
    	t.datetime :datetime

      t.timestamps
    end
  end
end
