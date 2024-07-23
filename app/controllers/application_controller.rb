class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :first_name, :last_name, :phone, :address, :city, :state, :zipcode, :dob, :role])
    devise_parameter_sanitizer.permit(:edit, :keys => [:phone])
  end
  
end
