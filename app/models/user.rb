class User < ApplicationRecord
  has_secure_password
  has_one :cart
  validates :cart, uniqueness: true
  has_many :sessions, dependent: :destroy
  validates :email_address, presence: true, uniqueness: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
