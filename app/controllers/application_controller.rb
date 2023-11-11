# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def parse_yaml(file)
    YAML.safe_load(File.open(file))
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name date_of_birth phone_number])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name date_of_birth phone_number])
  end
end
