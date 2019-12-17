class CartItemsController < ApplicationController
	def index
		@user=User.find(params[:user_id])
		@cartitems=@user.cart_items
		@totalprice=0
	end

	def create
	 	@product=Product.find(params[:cart_item][:product])
		@cartitem=CartItem.new
		@cartitem.count= params[:cart_item][:count]
		@cartitem.product_id=@product.id
		@cartitem.user_id=current_user.id

		if @cartGitem.save
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

	def update
		@cartitem=CartItem.find(params[:id])
		@cartitem.count=params[:cart_item][:count]
		if @cartitem.save
			redirect_to user_cart_items_path(current_user.id)
		else
			@user=User.find(params[:user_id])
			@cartitems=@user.cart_items
			@totalprice=0
			render :index
		end
	end

	def destroy
		@user=User.find(params[:user_id])
		@cartitem=CartItem.find(params[:id])
		@cartitem.destroy
		redirect_to user_cart_items_path(@user.id)
	end

end
