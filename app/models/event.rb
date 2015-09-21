class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :events_users
  has_many :users, through: :events_users
end
