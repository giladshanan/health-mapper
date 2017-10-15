class User < ApplicationRecord
  has_secure_password

  has_many :providers

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :password, length: { minimum: 8 }
end