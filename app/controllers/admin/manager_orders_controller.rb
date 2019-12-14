class Admin::ManagerOrdersController < ApplicationController
	def index
		@orders=Order.all
	end

	def show
		@order=Order.find(params[:id])
		@orderitems=@order.order_items
	end
end
