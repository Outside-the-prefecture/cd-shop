class UsersController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	skip_before_action :require_login, only:[:search]
		before_action :correct_user, only: [:edit,:update,:show,:destroy]
	def show
		@user = User.find(params[:id])
		@orders = @user.orders.page(params[:page]).per(2)
		@addresses = @user.addresses
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   redirect_to user_path(@user.id)
		else
			render :edit
		end

	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	def search
		@artist_or_genre_or_song_or_product=params[:option]
		      @genres=Genre.all
		      @artists=Artist.all
		      @artistname = ""
		      @all_ranks = Product.with_deleted.find(Favorite.group(:product_id).order('count(product_id) desc').limit(30).pluck(:product_id))
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




private

def user_params
	params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :phone_number, :postal_code, :address, addresses_attributes: [:address,:user_id,:id,:_destroy])
end

	def correct_user
		user=User.find(params[:id])
		if current_user!=user
			redirect_to user_path(current_user)
		end
	end
end