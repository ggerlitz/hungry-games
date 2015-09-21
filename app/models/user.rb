class User < ActiveRecord::Base
	has_many :events
	has_many :events_users
	# has_many :events, through: :users
	validates_presence_of :first_name, :last_name, :email, :password, :address
	validates_uniqueness_of :email
	validates_presence_of :password_confirmation, on: :create
	validates_confirmation_of :password
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	def full_name
		"#{first_name} #{last_name}"
	end
end