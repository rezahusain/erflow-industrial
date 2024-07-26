class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    patient_requests_path(current_user) # your path
  end

  def after_sign_up_path_for(resource)
    patient_requests_path(current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :first_name, :last_name, :phone, :address, :city, :state, :zipcode, :dob, :role])
    devise_parameter_sanitizer.permit(:edit, :keys => [:phone])
  end
  
end
