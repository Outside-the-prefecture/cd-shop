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
			  @artists=Artist.where(name: params[:search])
		elsif @artist_or_genre_or_song_or_product=="2"
			  @genres=Genre.where(name: params[:search])
		elsif @artist_or_genre_or_song_or_product=="3"
			  @songs=Song.where(name: params[:search])
		else  @artist_or_genre_or_song_or_product=="4"
			  @products=Product.where(name: params[:search])
		end
	end

end
