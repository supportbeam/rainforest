class User < ActiveRecord::Base

	has_secure_password #a library inherited from ActiveRecord
	# automatically add attr_accessor :password, :password_confirmation in your user model for you, which sets them up as virtual attributes (not database-backed) and special methods such as authenticate below
	# def authenticate
	# 	secret
	# end
	#validates :password, confirmation: true

	has_many :reviews
	has_many :products, through: :reviews

end
