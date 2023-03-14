class ApplicationController < ActionController::Base
    before_action :configure_devise_params, if: :devise_controller?

    protected
    def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name date_of_birth 
        address email password password_confirmation account_type role])
    end
end
