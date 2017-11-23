class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :orders, class_name: 'ShoppingCart::Order', foreign_key: :user_id
  has_one :billing, class_name: 'ShoppingCart::Billing', foreign_key: :user_id
  has_one :shipping, class_name: 'ShoppingCart::Shipping', foreign_key: :user_id
  has_many :addresses, class_name: 'ShoppingCart::Address', foreign_key: :user_id
end
