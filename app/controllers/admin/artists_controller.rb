class Admin::ArtistsController < ApplicationController
	skip_before_action :require_login
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


