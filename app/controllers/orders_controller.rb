class OrdersController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@address = @user.addresses
	end
	def create
		@user = current_user
		if @user.save
			redirect _to user_registration_path(@user.id)
		end
	end
	def finish
	end
end