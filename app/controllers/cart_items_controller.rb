class CartItemsController < ApplicationController
	def index
		@user=User.find(params[:user_id])
		@cartitems=@user.cart_items
		@totalprice=0
	end

	def create
	    @product=Product.find(params[:product_id])
		@cartitem=CartItem.new
		@cartitem.product_id=@product.id
		@cartitem.user_id=current_user.id

		if @cartitem.save
			redirect_to product_path(@product.id)

		else
			@discs=@product.discs
			@songs=disc.songs
			@orderitems=@product.order_items
			@arrivals=@product.arrivals
			@cartitem=CartItem.new
			render "products/show"
	    end
	end

	def destroy
		@user=User.find(params[:user_id])
		@cartitem=CartItem.find(params[:id])
		@cartitem.destroy
		redirect_to user_cart_items_path(@user.id)
	end

end
