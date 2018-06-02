class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :phone_number, presence: true
  validates :password, length: { minimum: 8 }, on: :create
end
