class ApplicationController < ActionController::Base
     before_action :authenticate_user!
     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

     def configure_permitted_parameters 
          # devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
          devise_parameter_sanitizer.permit(:sign_up, keys: [ :user_name, :branch_id, :authority_level_id ])
          devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :branch_id, :authority_level_id])
     end
end