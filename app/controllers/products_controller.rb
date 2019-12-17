class ProductsController < ApplicationController
	def index
		@products =Product.page(params[:page]).per(12)
	end

	def show
		@product=Product.find(params[:id])
		@discs=@product.discs
        @count=0
        @number=0
		@orderitems=@product.order_items
		@arrivals=@product.arrivals
		@cartitem=CartItem.new
	end

end
