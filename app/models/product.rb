class Product < ApplicationRecord

	has_many :arrivals
	has_many :cart_items
	has_many :order_items

	has_many :discs, dependent: :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true

	belongs_to :artist
	belongs_to :label
	belongs_to :genre
        def Genre.search(search, artist_or_genre_or_song_or_product)
          if artist_or_genre_or_song_or_product=="4"
              Product.where(['name LIKE ?', "#{search}"])
        	else
        	  Product.all
        	end
        end
end
