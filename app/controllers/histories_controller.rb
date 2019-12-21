class HistoriesController < ApplicationController
	def show
		@order=Order.find(params[:id])
		@orderitems=@order.order_items
		@user=User.find(params[:user_id])
	end
end
