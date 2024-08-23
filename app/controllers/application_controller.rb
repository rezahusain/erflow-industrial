# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #Comment: Great job actually rescuing the error.

  # Reroutes after sign ins and sign ups to the right spot
  def after_sign_in_path_for(_resource)
    landing_page_path
  end

  def after_sign_up_path_for(_resource)
    landing_page_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username first_name last_name phone address city state zipcode dob role])
    devise_parameter_sanitizer.permit(:edit, keys: [:phone])
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back fallback_location: landing_page_path
  end
end
