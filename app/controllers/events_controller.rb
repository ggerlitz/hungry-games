class EventsController < ApplicationController
  def new
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@event = Event.new
  end

  def index
  end

  def edit
  end

  def show
  end
end
