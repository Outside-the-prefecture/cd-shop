class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@orders = @user.orders
	end

	def edit
	end

	def update

	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	def search
		@artist_or_genre_or_song_or_product=params[:option]
		if    @artist_or_genre_or_song_or_product=="1"
			  @artist=Artist.find_by(name: params[:search])
			  if @artist.nil?
			  else
		      @products=Product.where(artist_id: [:@artist.id])
		      end
		elsif @artist_or_genre_or_song_or_product=="2"
			  @genre=Genre.find_by(name: params[:search])
			  if @genre.nil?
			  else
			  @products=Product.where(genre_id: [:@genre.id])
			  end
		elsif @artist_or_genre_or_song_or_product=="3"
			  @songs=Song.find_by(name: params[:search])
		else  @artist_or_genre_or_song_or_product=="4"
			  @product=Product.find_by(name: params[:search])
		end
	end

end
