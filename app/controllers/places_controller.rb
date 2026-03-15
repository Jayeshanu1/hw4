class PlacesController < ApplicationController

  def index
    if session[:user_id] == nil
      redirect_to "/sessions/new"
    else
      @places = Place.where({ :user_id => session[:user_id] })
    end
  end

  def show
    if session[:user_id] == nil
      redirect_to "/sessions/new"
    else
      @place = Place.find_by({ "id" => params["id"] })
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session[:user_id] })
    end
  end

  def new
    if session[:user_id] == nil
      redirect_to "/sessions/new"
    end
  end

  def create
    if session[:user_id] == nil
      redirect_to "/sessions/new"
    else
      @place = Place.new
      @place["name"] = params["name"]
      @place["user_id"] = session[:user_id]
      @place.save
      redirect_to "/places"
    end
  end

end