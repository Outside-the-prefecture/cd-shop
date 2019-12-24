class ReviewsController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	skip_before_action :require_login,only: [:index]
	before_action :require_admin_already
	before_action :correct_user,only:[:edit]
	def index
		@product=Product.find(params[:product_id])
		@reviews=Review.where(product_id: @product.id).page(params[:page]).per(10)
		@review=Review.new
		@reviewscount=@product.reviews
	end
	def create
		@review=Review.new(review_params)
		@review.user_id=current_user.id
		@product=Product.find(params[:product_id])
		@review.product_id=@product.id
		if @review.save
			redirect_to product_path(@product.id)
		else
			@favorite = Favorite.new
			@discs=@product.discs
	        @count=0
	        @number=0
			@orderitems=@product.order_items
			@arrivals=@product.arrivals
			@cartitem=CartItem.new
			@reviews=Review.where(product_id:@product.id).limit(10)
			@reviewscount=@product.reviews
			@products=Product.order("RANDOM()").limit(6)
			render "products/show"
		end
	end

	def edit
		@review=Review.find(params[:id])
		@product=Product.find(params[:product_id])
	end

	def update
		@review=Review.find(params[:id])
		@product=Product.find(params[:product_id])
		if @review.update(review_params)
			redirect_to product_path(@product.id)
		else
			render :edit
		end
	end

	def destroy
		@review=Review.find(params[:id])
		@product=Product.find(params[:product_id])
		@review.destroy
		redirect_to product_path(@product.id)
	end

	private
	def review_params
		params.require(:review).permit(:content,:name)
    end

    	def correct_user
    		@review=Review.find(params[:id])
    		@product=Product.find(params[:product_id])
		if @review.user.id!=current_user.id
			redirect_to product_path(@product.id)
		end
	end

end
