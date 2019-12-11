class Admin::GenresController < ApplicationController
	def create
		genre=Genre.new(genre_params)
		if genre.save
			redirect_to admin_manager_products_path
		else
			@label=Label.new
			@artist=Artist.new
			@genre=Genre.new
			@product=Product.new
			@disc=@product.discs.build
			@song=@disc.songs.build
			@labels=Label.all
			@artists=Artists.all
			@genres=Genre.all
			render "manager_product/new"
		end
	end
	private
	def genre_params
		params.require(:genre).permit(:name)
	end
end
