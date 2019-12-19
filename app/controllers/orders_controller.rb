class OrdersController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@address = @user.addresses
		@cartitems = @user.cart_items
		@totalprice = 0
		@order = Order.new

		@cartitems.each do |f|
			@product = Product.find_by(id: f.product_id)
			@totalprice = @product.price * f.count + @totalprice
		end
		@totalamount=@totalprice*1.1
	end

	def create
		@user = User.find(params[:user_id])
		@cartitems = @user.cart_items
		@totalprice = 0
		@cartitems.each do |f|
			@product = Product.find_by(id: f.product_id)
			@totalprice = @product.price * f.count + @totalprice
		end
		@totalamount=@totalprice*1.1
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		if  @order.delivery_target_address.to_i == 0
			if @order.save
			else
				@user = User.find(params[:user_id])
				@address = @user.addresses
				@cartitems = @user.cart_items
				@totalprice = 0
				@cartitems.each do |f|
				  @product = Product.find_by(id: f.product_id)
				  @totalprice = @product.price * f.count + @totalprice
		        end
			    @totalamount=@totalprice*1.1
			    render :new
		    end
		else
			@delivery_target_address=Address.find(@order.delivery_target_address.to_i)
			@order.delivery_target_address = @delivery_target_address.address
			@order.last_name = current_user.last_name
			@order.first_name = current_user.first_name
			@order.kana_last_name = current_user.kana_last_name
			@order.kana_first_name = current_user.kana_first_name
			@order.postal_code = current_user.postal_code
			@order.mail = current_user.email
			@order.phone_number = current_user.phone_number
			@order.shipping_fee = 500
			@order.total_amount = @totalamount+@order.shipping_fee
			if  @order.save
				current_user.cart_items.each do |i|
					puts i.user.email
					orderitems = OrderItem.new
					orderitems.user_id = current_user.id
					orderitems.product_id = i.product_id
					orderitems.number = i.count
					orderitems.tax = 1.1
					orderitems.price = i.product.price
					orderitems.order_id = @order.id
					orderitems.save
					puts orderitems.errors.full_messages
					i.destroy
				end
			    redirect_to orders_finish_path
			else
			    @user = User.find(params[:user_id])
			    @address = @user.addresses
				@cartitems = @user.cart_items
				@totalprice = 0
				@cartitems.each do |f|
					@product = Product.find_by(id: f.product_id)
					@totalprice = @product.price * f.count + @totalprice
				end
				@totalamount=@totalprice*1.1
				render :new
			end
	    end
	end

	def finish
	end

	private
	def order_params
		params.require(:order).permit(:payment_method,:delivery_target_address)
	end
end