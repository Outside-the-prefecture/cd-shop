class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 		has_many :orders
 		has_many :addresses
 		has_many :cart_items
 		has_many :products, through: :cart_items

 end
