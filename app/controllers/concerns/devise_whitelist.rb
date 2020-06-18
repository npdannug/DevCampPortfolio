module DeviseWhitelist
  extend ActiveSupport::Concern

  def configure_permitted_params 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end