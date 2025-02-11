# app/controllers/gossips_controller.rb
class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :destroy]

  # Affiche le formulaire de création d'un potin
  def new
    @gossip = Gossip.new
  end

  # Crée un potin et redirige vers la page d'accueil
  def create
    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      author_id: User.first.id # Remplace par l'utilisateur connecté (par exemple, current_user.id)
    )
  
    if @gossip.save
      redirect_to root_path, notice: "Ton potin a été créé avec succès !"
    else
      flash.now[:alert] = "Une erreur est survenue. Vérifie les champs du formulaire."
      render :new
    end
  end

  def show
    # Logique pour afficher un potin spécifique
  end

  def destroy
    @gossip.destroy
    redirect_to root_path, notice: 'Le potin a été supprimé avec succès.'
  end

  
  private

  # Permet de sécuriser les paramètres du formulaire
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  # Récupère un potin par son ID
  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
end
