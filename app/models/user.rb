class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :password, length: 4..16
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true

  has_many :categories
  has_many :messages
end
