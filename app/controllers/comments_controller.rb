# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gossip

  def create
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @gossip, notice: 'Commentaire ajouté avec succès !'
    else
      redirect_to @gossip, alert: 'Erreur lors de l\'ajout du commentaire.'
    end
  end

  def edit
    @comment = @gossip.comments.find(params[:id])
  end

  def update
    @comment = @gossip.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @gossip, notice: 'Commentaire mis à jour avec succès !'
    else
      render :edit
    end
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
