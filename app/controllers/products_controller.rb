class ProductsController < ApplicationController
	def index
		@products =Product.all
	end

	def show
		@product=Product.find(params[:id])
		@discs=@product.discs
		@songs=disc.songs
		@orderitems=@product.order_items
		@arrivals=@product.arrivals
	end

end
