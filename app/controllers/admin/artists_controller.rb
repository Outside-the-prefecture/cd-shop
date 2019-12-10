class Admin::ArtistsController < ApplicationController
	def create
		artist=Artist.new(artist_params)
		if artist.save
			redirect_to admin_manager_products_path
		else
			@label=Label.new
			@artist=Artist.new
			@genre=Genre.new
			@product=Product.new
			@labels=Label.all
			@artists=Artists.all
			@genres=Genre.all
			render "manager_product/new"
		end
	end
	private
	def artist_params
		params.require(:artist).permit(:name)
	end
end
