class User < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation, :address
	validates_uniqueness_of :email
	validates_confirmation_of :password

	def full_name
		"#{first_name} #{last_name}"
	end
end