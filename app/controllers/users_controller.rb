class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@orders = @user.orders
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def destroy
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



private

def user_params
	params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :phone_number, :postal_code, :address)
end

end