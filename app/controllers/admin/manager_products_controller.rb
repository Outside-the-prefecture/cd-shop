class Admin::ManagerProductsController < ApplicationController
	skip_before_action :require_login
	def index

		@products =Product.order("id DESC").page(params[:page]).per(24)
	end


	def show
		@product=Product.find(params[:id])
		@count=0
		@number=0
		@discs=@product.discs
		@orderitems=@product.order_items
		@arrivals=@product.arrivals
		@arrival=Arrival.new
	end

	def new
			@label=Label.new
			@artist=Artist.new
			@genre=Genre.new
			@product=Product.new
			@labels=Label.order("name")
			@artists=Artist.order("name")
			@genres=Genre.order("name")
	end

	def create
		@product=Product.new(product_params)
		if @product.save
			redirect_to  admin_manager_products_path
		else
			@label=Label.new
			@artist=Artist.new
			@genre=Genre.new
			@disc=@product.discs.build
			@song=@disc.songs.build
			@labels=Label.order("name")
			@artists=Artist.order("name")
			@genres=Genre.order("name")
			render :new
		end
	end

	def edit
		@product=Product.find(params[:id])
	end

	def update
		@product=Product.find(params[:id])
		if @product.update(update_product_params)
			redirect_to admin_manager_products_path
		else
			render :edit
		end
	end

	def destroy
		@product=Product.find(params[:id])
		@product.destroy
		redirect_to admin_manager_products_path
	end

	private
	def product_params
		params.require(:product).permit(:name,:jacket_image,:price,:release_date,:artist_id,:label_id,:genre_id,:status,discs_attributes: [:name,:product_id, songs_attributes: [:name,:disc_id,:song_order]])
	end

	def update_product_params
		params.require(:product).permit(:name,:jacket_image,:price,:release_date,:artist_id,:label_id,:genre_id,:status,discs_attributes: [:name,:product_id,:id,:_destroy, songs_attributes: [:name,:disc_id,:song_order,:id,:_destroy]])
	end
end
