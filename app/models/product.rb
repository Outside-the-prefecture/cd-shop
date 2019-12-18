class Product < ApplicationRecord

	has_many :arrivals
	has_many :cart_items
	has_many :users, through: :cart_items
	has_many :order_items
	has_many :orders, through: :order_items
	has_many :favorites
	has_many :favorited_users, through: :favorites, source: :user

	has_many :discs, dependent: :destroy
	accepts_nested_attributes_for :discs, allow_destroy: true

	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	belongs_to :user


	attachment :jacket_image


end
