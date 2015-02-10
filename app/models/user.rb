class User < ActiveRecord::Base

	has_many :reviews
	has_many :products, through: :reviews 

	has_secure_password #a library inherited from ActiveRecord
	# automatically add attr_accessor :password, :password_confirmation in your user model for you, which sets them up as virtual attributes (not database-backed) and special methods such as authenticate below
	# def authenticate
	# 	secret
	# end
	
	#validates :password, confirmation: true

	validates :name, :email, presence: true #validates user inputs a name when they create a user
	# validates :email, uniqueness: true, message: "That email exists" #validates the email is unique in the database
	# validate :name_starts_with_a
	# private
	# def name_starts_with_a
	# 	if first_name[0] != 'A'
	# 	errors.add(:first_name, "Doesn't start with A") # This shows a message 
	# end
end
