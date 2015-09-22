class RestaurantsController < ApplicationController
  def index
    if current_user
      @restaurants = Restaurant.near(current_user, 5)
    else
      @restaurants = Restaurant.all
    end
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def edit
  end

  def search
    cuisine = Restaurant.find_by(cuisine: params[:cuisine])
    redirect_to cuisine_name_path(cuisine.display_cuisine)
  end

  def cuisine
    @restaurants = Restaurant.find_by_cuisine_name(params[:cuisine])
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end
    render :index
  end
end
