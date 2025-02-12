class GossipsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  # Affiche le formulaire pour créer un potin
  def new
    @gossip = Gossip.new
  end

  # Crée un potin et redirige vers la page d'accueil
  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.author = current_user
  
    if @gossip.save
      redirect_to root_path, notice: "Ton potin a été créé avec succès !"
    else
      flash.now[:alert] = "Une erreur est survenue. Vérifie les champs du formulaire."
      render :new
    end
  end

  def index
    @gossips = Gossip.all
  end

  def show
  end

  # Affiche le formulaire d'édition d'un potin
  def edit
  end

  # Met à jour un potin en BDD
  def update
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: "Le potin a été mis à jour avec succès !"
    else
      flash.now[:alert] = "Une erreur est survenue. Vérifie les champs du formulaire."
      render :edit
    end
  end

  # Supprime un potin
  def destroy
    @gossip = Gossip.find(params[:id])
  
    if @gossip.destroy
      redirect_to root_path, notice: "Le potin a été supprimé avec succès."
    else
      redirect_to gossip_path(@gossip), alert: "Impossible de supprimer le potin."
  end
end

  private

  # Sécurise les paramètres du formulaire
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  # Récupère un potin par son ID
  def set_gossip
    @gossip = Gossip.find(params[:id])
    if @gossip.nil?
      redirect_to gossips_path, alert: "Le potin demandé n'a pas été trouvé."
    end
  end
end
