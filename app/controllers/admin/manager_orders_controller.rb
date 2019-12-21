class Admin::ManagerOrdersController < ApplicationController
	skip_before_action :require_login
	def index
		@orders=Order.all
		@orders = Order.page(params[:page]).per(10)
	end

	def show
		@order=Order.find(params[:id])
		@orderitems=@order.order_items
		@totalamout=0
	end
end
