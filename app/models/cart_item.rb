class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :count, presence: true
	validates :count, numericality: {only_integer: true}
	validates :count, numericality: {greater_than_or_equal_to: 1}
end
