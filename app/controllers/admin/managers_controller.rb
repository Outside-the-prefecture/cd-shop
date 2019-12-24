class Admin::ManagersController < ApplicationController
	skip_before_action :require_login
	def index
		@users=User.page(params[:page]).per(50)
	end

	def show
		@user=User.find(params[:id])
		@orderss = Order.page(params[:page]).per(5)
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

private

  def user_params
  	  params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :phone_number, :postal_code, :address, addresses_attributes: [:address,:user_id,:id,:_destroy])
  end
end

