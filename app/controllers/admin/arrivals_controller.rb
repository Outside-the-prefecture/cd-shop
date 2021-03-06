class Admin::ArrivalsController < ApplicationController
  skip_before_action :require_login

  def create
  	@product=Product.find(params[:manager_product_id])
  	@arrival=Arrival.new(arrival_params)
  	@arrival.product_id=@product.id
  	if @arrival.save
  		redirect_to admin_manager_product_path(@product.id)
  	else
		@count=0
		@number=0
		@discs=@product.discs
		@orderitems=@product.order_items
		@arrivals=@product.arrivals
		render "admin/manager_products/show"
	end

  end

  private
  def arrival_params
  	params.require(:arrival).permit(:count,:datetime)
  end
end
