class Artist < ApplicationRecord
	has_many :products
        def Genre.search(search, artist_or_genre_or_song_or_product)
          if artist_or_genre_or_song_or_product=="1"
              Artist.where(['name LIKE ?', "#{search}"])
        	else
        	  Artist.all
        	end
        end
end
