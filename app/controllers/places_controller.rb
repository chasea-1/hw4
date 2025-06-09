class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries.where(user: current_user)
    @entry = Entry.new
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
