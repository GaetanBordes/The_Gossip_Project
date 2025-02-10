class PagesController < ApplicationController
  def welcome
    @first_name = params[:first_name] || "Invité"
    
    # Charger tous les potins pour affichage
    @gossips = Gossip.all
  end

  def publish
    # Créer un nouvel utilisateur
    user = User.create(first_name: params[:first_name], last_name: params[:last_name])

    # Créer un nouveau potin et l'associer à l'utilisateur
    Gossip.create(
      title: params[:title],
      content: params[:content],
      author_id: user.id
    )

    # Rediriger vers la page d'accueil avec un message de confirmation
    redirect_to root_path, notice: 'Ton potin a bien été publié !'
  end
end
