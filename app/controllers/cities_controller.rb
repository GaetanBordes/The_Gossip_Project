class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @gossips = Gossip.joins(:author).where(users: { city_id: @city.id })
  end
end
