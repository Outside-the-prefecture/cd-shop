class Admin::ManagerOrdersController < ApplicationController
	def index
		@orders=Order.all
		@orders = Order.page(params[:page]).per(2)
	end

	def show
		@order=Order.find(params[:id])
		@orderitems=@order.order_items
	end
end
