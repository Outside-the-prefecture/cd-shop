class HistoriesController < ApplicationController
	def show
		@order=Order.find(params[:id])
		@orderitems=@order.order_items
		@user=User.find(id: [:user_id])
	end
end
