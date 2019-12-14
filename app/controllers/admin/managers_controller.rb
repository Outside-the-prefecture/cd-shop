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
		if @user.update(user_params)
			redirect_to admin_manager_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to admin_managers_path
	end

end
