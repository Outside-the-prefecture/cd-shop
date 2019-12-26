class Admin::ContactsController < ApplicationController

	skip_before_action :require_login
	skip_before_action :require_admin_login,only:[:index, :show]

	def index
		@contacts = Contact.all
	end

	def show
		@contact = Contact.find(params[:id])
	end
end