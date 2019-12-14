class ProductsController < ApplicationController
	def index
		@products =Product.all
	end

	def show
		@product=Product.find(params[:id])
		@discs=@product.discs

		@orderitems=@product.order_items
		@arrivals=@product.arrivals
		@cartitem=CartItem.new
	end

end
