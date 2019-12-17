class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 		has_many :orders
 		has_many :addresses
 		accepts_nested_attributes_for :addresses, allow_destroy: true
 		has_many :cart_items
 		has_many :products, through: :cart_items

 		validates :last_name, presence: true
 		validates :first_name, presence: true
 		validates :kana_last_name, presence: true
 		validates :kana_first_name, presence: true
 		validates :postal_code,presence: true, format: { with: /\A\d{3}\-?\d{4}\z/}
 		validates :phone_number, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ }
 		validates :address, presence: true


 end
