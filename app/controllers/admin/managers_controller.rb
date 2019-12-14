class Admin::ManagersController < ApplicationController
	def index
		@users=User.all
	end

	def show
		@user=User.find(params[:id])
		@orders=@user.orders
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
	end

	def destroy
	end

end
