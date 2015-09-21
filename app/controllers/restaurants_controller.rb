class RestaurantsController < ApplicationController
  def index
    if current_user
      @restaurants = Restaurant.near(current_user, 5)
    else
      @restaurants = Restaurant.all
    end

  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def edit
  end
end
