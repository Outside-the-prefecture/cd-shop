class Admin::ArtistsController < ApplicationController
	def create
		artist=Artist.new(artist_params)
		if artist.save
			redirect_to new_admin_manager_product_path
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
			render "manager_products/new"
		end
	end
	private
	def artist_params
		params.require(:artist).permit(:name)
	end
end
