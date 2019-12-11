class ApplicationController < ActionController::Base
	def search
		@artist_or_genre_or_song_or_product=params[:option]
		if @artist_or_genre_or_song_or_product=="1"
			@artists=Artist.search(params[:search],@artist_or_genre_or_song_or_product)
		elsif @artist_or_genre_or_song_or_product=="2"
			  @genres=Genre.search(params[:search],@artist_or_genre_or_song_or_product)
		elsif @artist_or_genre_or_song_or_product=="3"
			  @songs=Song.search(params[:search],@artist_or_genre_or_song_or_product)
		else  @artist_or_genre_or_song_or_product=="4"
			  @products=Product.search(params[:search],@artist_or_genre_or_song_or_product)
			end

	end





 def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name,:kana_last_name, :kana_first_name, :postal_code,:phone_number,:address, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:email , :password]
  end
end
