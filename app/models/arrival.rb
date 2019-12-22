class Arrival < ApplicationRecord
	belongs_to :product
	validates :count,presence: true
	validates :datetime,presence: true
end
