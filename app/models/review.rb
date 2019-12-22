class Review < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :content, presence: true
	validates :content, length: {maximum:100}
	validates :name, length: {maximum:15}
end
