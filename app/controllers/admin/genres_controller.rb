class Admin::GenresController < ApplicationController
	skip_before_action :require_login
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
			@labels=Label.all
			@artists=Artist.all
			@genres=Genre.all
			render "admin/manager_products/new"
		end
	end
	private
	def genre_params
		params.require(:genre).permit(:name)
	end
end
