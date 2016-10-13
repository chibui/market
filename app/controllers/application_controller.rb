class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied! Please sign up as a seller"
    redirect_to root_url
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :tos_status, :contact, :phone, :address, :abn, :bio ])
      devise_parameter_sanitizer.permit(:account_update, keys: [ :name ] )
    end

end
