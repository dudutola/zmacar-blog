# frozen_string_literal: true

# ApplicationController is the base controller from which all other
# controllers in the application inherit. It sets up common behavior
# for the entire application, such as parameter sanitization for Devise.
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
