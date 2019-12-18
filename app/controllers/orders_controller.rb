class OrdersController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@user = current_user
		@address = @user.addresses
		@cartitems = @user.cart_items
		@totalprice = 0

		@cartitems.each do |f|
			@product = Product.find_by(id: f.product_id)
			@totalprice = @product.price * f.count + @totalprice
		end
	end
	def create
		@order = Order.new(user_params)
		@order.user_id = current_user.id
		@order.save
		current_user.cart_items.each do |i|
			puts i.user.email
			orderitems = OrderItem.new
			orderitems.user_id = current_user.id
			orderitems.product_id = i.product_id
			orderitems.number = i.count
			orderitems.tax = 0.1
			orderitems.price = i.product.price
			orderitems.order_id = @order.id
			orderitems.save
			puts orderitems.errors.full_messages
		end
		redirect_to orders_finish_path

	end

	def finish
	end
	
	private
	def user_params
		params.require(:user).permit(:payment_method,:delivery_target_address)
	end
end