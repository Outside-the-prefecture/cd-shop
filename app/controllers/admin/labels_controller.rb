class Admin::LabelsController < ApplicationController
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
			@labels=Label.all
			@artists=Artist.all
			@genres=Genre.all
			render "admin/manager_products/new"
		end
	end

	private

	def label_params
		params.require(:label).permit(:name)
	end
end
