class Product < ActiveRecord::Base
	# after_validation :format_name 
  has_many :reviews
  has_many :users, through: :reviews

	validates :description, :name, presence: true # a new Product can only be created if both description and the name values are present
  validates :price_in_cents, numericality: {only_integer: true} # a new Product can only be created if price_in_cents in only an integer 


  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

end
