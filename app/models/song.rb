class Song < ApplicationRecord
	belongs_to :disc
        def Genre.search(search, artist_or_genre_or_song_or_product)
          if artist_or_genre_or_song_or_product=="3"
              Song.where(['name LIKE ?', "#{search}"])
          else
        	  Song.all
          end
        end
end
