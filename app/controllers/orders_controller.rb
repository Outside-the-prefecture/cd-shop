class OrdersController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@address = @user.addresses
		@cartitems = @user.cart_items

		@totalprice = 0

		@cartitems.each do |f|
			@product = Product.find_by(id: f.product_id)
			@totalprice = @product.price * f.count + @totalprice

		end


		


	end
	def create
		@user = current_user
		if @user.save
			redirect_to user_registration_path(current_user.id)
		end
	end
	def finish
	end
end