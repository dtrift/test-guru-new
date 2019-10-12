class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(user)
    user.is_a?(Admin) ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer
        .permit(:sign_up, keys: [
          :first_name, :last_name, :email,
          :password, :password_confirmation
        ])
    # devise_parameter_sanitizer
        # .permit(:sign_in, keys: [
        #   :login, :password, :password_confirmation
        # ])
    # devise_parameter_sanitizer
        # .permit(:account_update, keys: [
        #   :username, :email, :password,
        #   :password_confirmation, :current_password
        # ])
  end
end
