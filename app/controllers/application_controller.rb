class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permet l'ajout de nouveaux attributs lors de l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city, :description, :birthdate])
    # Permet l'ajout de nouveaux attributs lors de la mise à jour du profil
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :city, :description, :birthdate])
  end
end