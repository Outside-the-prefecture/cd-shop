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

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to admin_manager_orders_path
		else
			redirect_to admin_manager_order_path(@order.id)
		end
	end

	def order_params
		params.require(:order).permit(:delivery_status)
	end
end
