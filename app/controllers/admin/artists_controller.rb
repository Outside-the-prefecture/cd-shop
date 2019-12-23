class Admin::ArtistsController < ApplicationController
	skip_before_action :require_login
	skip_before_action :require_admin_login,only:[:show]
	def show
		@artist=Artist.find(params[:id])
		@products=@artist.products.page(params[:page]).per(24)
		@genres=Genre.all
        @artists=Artist.all
		@all_ranks = Product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(30).pluck(:product_id))
		@artistname = ""
	end
	def create
		@artist=Artist.new(artist_params)
		if @artist.save
			redirect_to new_admin_manager_product_path
		else
			@label=Label.new
			@genre=Genre.new
			@product=Product.new
			@disc=@product.discs.build
			@song=@disc.songs.build
			@labels=Label.all
			@artists=Artist.all
			@genres=Genre.all
			render template: "admin/manager_products/new"
		end
	end

	private
	def artist_params
		params.require(:artist).permit(:name)
	end
end


