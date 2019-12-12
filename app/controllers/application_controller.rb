class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?






 def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name,:kana_last_name, :kana_first_name, :postal_code,:phone_number,:address, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:email , :password]
  end
end
