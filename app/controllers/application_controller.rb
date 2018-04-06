class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, if: :not_unlocked_controllers
  before_action :configure_permitted_parameters, if: :devise_controller?

  def ticketit_user
    current_user
  end
  helper_method :ticketit_user

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def not_unlocked_controllers
    if controller_name != 'home'
      true
    else
      false
    end
  end

end
