class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @gossips = @user.gossips # Supposons que chaque utilisateur ait plusieurs potins
    render 'pages/profile'
  end

  def show
    @user = User.find(params[:id])
  end
end
