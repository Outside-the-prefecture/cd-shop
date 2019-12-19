class Order < ApplicationRecord
	has_many :order_items
	has_many :products, through: :order_items

	belongs_to :user
	validates :payment_method ,presence: true
	validates :delivery_target_address, presence: true

end
