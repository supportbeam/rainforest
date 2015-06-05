class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :product

	validates :user, presence: true
  validates :comment, :presence => true

end
