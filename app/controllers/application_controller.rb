class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected
     def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :firstname, :lastname, :password) }
       devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:firstname, :lastname) }
     end
end
