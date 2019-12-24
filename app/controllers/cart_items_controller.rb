class CartItemsController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	before_action :correct_user
	def index
		@user=User.find(params[:user_id])
		@cartitems=@user.cart_items
		@totalprice=0
		@totalamount=0
	end

	def create
	     @usercarts=current_user.cart_items
	     @review=Review.new
		 @product=Product.find(params[:cart_item][:product])
		 @reviews=Review.where(product_id:@product.id).limit(10)
		 @reviewscount=@product.reviews
		if @product.status=="販売停止中"
				@discs=@product.discs
		        @count=0
		        @number=0
				@orderitems=@product.order_items
				@arrivals=@product.arrivals
				flash[:notice]="現在、#{@product.name}は販売停止中です。"
			    redirect_to product_path(@product.id)
	    else
		     if @cartitemequal=@usercarts.find_by(product_id: @product.id)
				@count = params[:cart_item][:count]
				@cartitemequal.count=@cartitemequal.count.to_i + @count.to_i
				@cartitemequal.save
				flash[:notice]="カートに#{@count}個入りました"
				redirect_to product_path(@product.id)
		    else
				@cartitem=CartItem.new
				@cartitem.count = params[:cart_item][:count]
				@cartitem.product_id =@product.id
				@cartitem.user_id=current_user.id

				if @cartitem.save
					flash[:notice]="カートに#{@cartitem.count}個入りました"
					redirect_to product_path(@product.id)

				else
					@discs=@product.discs
		            @count=0
		            @number=0
					@orderitems=@product.order_items
					@arrivals=@product.arrivals
					@products=Product.order("RANDOM()").limit(6)
					render "products/show"
			    end
			end
		end
	end

	def update
		@cartitem=CartItem.find(params[:id])
		@cartitem.count=params[:cart_item][:count]
		if @cartitem.save
			redirect_to user_cart_items_path(user_id: current_user.id)
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

	private

	def correct_user
		user=User.find(params[:user_id])
		if current_user!=user
			redirect_to user_cart_items_path(user_id: current_user.id)
		end
	end

end
