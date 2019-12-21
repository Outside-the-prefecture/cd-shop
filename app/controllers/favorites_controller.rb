class FavoritesController < ApplicationController
	skip_before_action :require_admin_login, raise: false
	before_action :correct_user, only: [:index]
	def index
		@user=User.find(params[:user_id])
		@favorites=@user.favorites
	end
def create
	@product=Product.find(params[:product_id])
	@favorite=Favorite.new
	@favorite.user_id=current_user.id
	@favorite.product_id=@product.id
	if @favorite.save
	redirect_to product_path(@product.id)
else
		@discs=@product.discs
        @count=0
        @number=0
		@orderitems=@product.order_items
		@arrivals=@product.arrivals
		@cartitem=CartItem.new
		render "products/show"
	end
  end

  def destroy
  	@product=Product.find(params[:product_id])
  	favorite=current_user.favorites.find_by(product_id: @product.id)
  	if favorite.destroy
	   redirect_to product_path(@product.id)
	else
		@discs=@product.discs
        @count=0
        @number=0
		@orderitems=@product.order_items
		@arrivals=@product.arrivals
		@cartitem=CartItem.new
		render "products/show"
	end
  end

  private

  	def correct_user
		user=User.find(params[:user_id])
		if current_user!=user
			redirect_to user_favorites_path(user_id: current_user.id)
		end
	end
end
