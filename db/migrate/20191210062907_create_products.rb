class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :name
    	t.string :jacket_image_id
    	t.integer :price
    	t.datetime :release_date
    	t.integer :artist_id
    	t.integer :label_id
    	t.integer :genre_id
    	t.datetime :deleted_at
    	t.string :status

      t.timestamps
    end
  end
end
