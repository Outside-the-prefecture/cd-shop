class Admin::LabelsController < ApplicationController
	skip_before_action :require_login
	def create
		@label=Label.new(label_params)
		if @label.save
			redirect_to new_admin_manager_product_path
		else
			@artist=Artist.new
			@genre=Genre.new
			@product=Product.new
			@disc=@product.discs.build
			@song=@disc.songs.build
			@labels=Label.order("name")
			@artists=Artist.order("name")
			@genres=Genre.order("name")
			render "admin/manager_products/new"
		end
	end

	private

	def label_params
		params.require(:label).permit(:name)
	end
end
