class Admin::ManagerProductsController < ApplicationController
	def index
	end

	def show
	end

	def new
			@label=Label.new
			@artist=Artist.new
			@genre=Genre.new
			@product=Product.new
			@labels=Label.all
			@artists=Artist.all
			@genres=Genre.all
	end

	def create
		product=Product.new(product_params)
		if product.save
			redirect_to admin_manager_products_path
		else
			@label=Label.new
			@artist=Artist.new
			@genre=Genre.new
			@product=Product.new
			@labels=Label.all
			@artists=Artist.all
			@genres=Genre.all
			render "new"
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def product_params
		params.require(:product).permit(:name,:jacket_image,:price,:release_date,:artist_id,:label_id,:genre_id, discs_attributes: [:name,:cd_id, songs_attributes: [:name,:disc_id,:song_order]])
	end

end
