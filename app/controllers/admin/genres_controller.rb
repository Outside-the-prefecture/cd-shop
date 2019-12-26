class Admin::GenresController < ApplicationController
	skip_before_action :require_login
	skip_before_action :require_admin_login,only:[:show]
	def show
		@genre=Genre.find(params[:id])
		@products=@genre.products.page(params[:page]).order("id DESC").per(24)
		@artists=Artist.all
	    @all_ranks = Product.with_deleted.find(Favorite.group(:product_id).order('count(product_id) desc').limit(30).pluck(:product_id))
		@artistname = ""
		@genres=Genre.all
	end

	def create
		@genre=Genre.new(genre_params)
		if @genre.save
			redirect_to new_admin_manager_product_path
		else
			@label=Label.new
			@artist=Artist.new
			@product=Product.new
			@disc=@product.discs.build
			@song=@disc.songs.build
			@labels=Label.order("name")
			@artists=Artist.order("name")
			@genres=Genre.order("name")
			render "admin/manager_products/new"
		end
	end
	private
	def genre_params
		params.require(:genre).permit(:name)
	end
end
