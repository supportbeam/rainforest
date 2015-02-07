class User < ActiveRecord::Base

	has_secure_password # automatically add attr_accessor :password, :password_confirmation in your model for you, which sets them up as virtual attributes (not database-backed)

end
