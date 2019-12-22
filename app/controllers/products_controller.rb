class ProductsController < ApplicationController
	skip_before_action :require_login
	skip_before_action :require_admin_login, raise: false
	before_action :require_admin_already
	def index
		@products =Product.page(params[:page]).per(12)
		@product = Product.new
	end

	def show
		@product=Product.find(params[:id])
		@favorite = Favorite.new
		@discs=@product.discs
        @count=0
        @number=0
		@orderitems=@product.order_items
		@arrivals=@product.arrivals
		@cartitem=CartItem.new
		@review=Review.new
		@reviews=@product.reviews
	end

	def create
		@product = Product.new(product_params)
		@product.user_id = current_user.id
		if @product.save
		   redirect_back(fallback_location: root_path)
		else
		   redirect_back(fallback_location: root_path)
		end
    end

    private
    def product_params
    	params.require(:product).permit(:content)
    end

end
