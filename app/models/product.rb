class Product < ActiveRecord::Base
	validates :description, :name, presence: true # a new Product can only be created if both description and the name values are present
  validates :price_in_cents, numericality: {only_integer: true} # a new Product can only be created if price_in_cents in only an integer 

end
