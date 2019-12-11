class Admin::LabelsController < ApplicationController
	def create
		label=Label.new(label_params)
		if label.save
			redirect_to admin_manager_products_path
		else
			@label=Label.new
			@artist=Artist.new
			@genre=Genre.new
			@product=Product.new
			@disc=@product.discs.build
			@song=@disc.songs.build
			@labels=Label.all
			@artists=Artists.all
			@genres=Genre.all
			render "manager_product/new"
		end
	end

	private
	def label_params
		params.require(:label).permit(:name)
	end
end
