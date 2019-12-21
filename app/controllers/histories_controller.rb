class HistoriesController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	before_action :correct_user
	def show
		@order=Order.find(params[:id])
		@orderitems=@order.order_items
		@user=User.find(params[:user_id])
	end

	private
		def correct_user
		user=User.find(params[:user_id])
		if current_user!=user
			redirect_to user_path(current_user)
		end
	end
end
