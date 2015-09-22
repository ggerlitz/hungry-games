class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :events_users
  has_many :users, through: :events_users
  after_create :add_current_user_to_event_users

  def add_current_user_to_event_users
  	users << user
  end

end
