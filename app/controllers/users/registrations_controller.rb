class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    city_name = params[:user][:city]
    city = City.find_or_create_by(name: city_name) # Trouve ou crée la ville
    @user = User.new(user_params.merge(city: city)) # Associe la ville à l'utilisateur
  
    if @user.save
      redirect_to @user, notice: "Utilisateur créé avec succès !"
    else
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :description, :birthdate, :city)
  end
  
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :first_name, :last_name, :description, :birthdate, :city])
  end
  
end