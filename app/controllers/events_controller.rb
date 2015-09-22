class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :join]
  before_action :set_restaurant, only: [:new, :create]
  before_action :set_event, only: [:show, :join]

  def new
  	@event = Event.new
  end

  def index
  end

  def edit
  end

  def show

  end

  def join
    @event.users << current_user
    redirect_to @event, notice: "Added to event."
  end

  def create
    @restaurant.events.create(event_params)
    redirect_to restaurants_path, notice: "New event created."
  end

  private

  def event_params
    params.require(:event).permit(:start).merge(user: current_user)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
