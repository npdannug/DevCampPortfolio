class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?
  include DeviseWhitelist


end
