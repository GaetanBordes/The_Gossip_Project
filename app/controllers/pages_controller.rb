class PagesController < ApplicationController
  def welcome
    @first_name = params[:first_name] || "Invité"
    @gossips = Gossip.all
  end

  def new_gossip
    # Cette action rendra la vue pour le formulaire de création d'un potin
  end

  def publish
    if params[:title].present? && params[:content].present?
      user = User.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        city: params[:city]
      )

      Gossip.create(
        title: params[:title],
        content: params[:content],
        author_id: user.id
      )

      redirect_to root_path, notice: "Potin publié avec succès !"
    else
      redirect_to new_gossip_path, alert: "Veuillez remplir tous les champs."
    end
  end
end
