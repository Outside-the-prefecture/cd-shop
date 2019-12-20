module FavoritesHelper
	def converting_to_jpy(favorite)
		"#{favorite.to_s(:delimited, delimiter: ',')}"
	end
end
