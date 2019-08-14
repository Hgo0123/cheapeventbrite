class ApplicationController < ActionController::Base
include UsersHelper
	def configure_devise_parameters
  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :email, :password, :password_confirmation)}
end
end

