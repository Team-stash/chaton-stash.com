class User < ApplicationRecord

  enum :role, %i[visitor admin super_admin], default: :visitor

  has_secure_password
  has_one :cart
  has_many :orders
  has_many :sessions, dependent: :destroy
  validates :email_address, presence: true, uniqueness: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  #after_create :welcome_send
  #def welcome_send
  #  UserMailer.welcome_email(self).deliver_now
  #end
end
