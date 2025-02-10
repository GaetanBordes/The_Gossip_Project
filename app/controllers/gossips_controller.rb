class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :destroy]

  def destroy
    @gossip.destroy
    redirect_to root_path, notice: 'Le potin a été supprimé avec succès.'
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
end
