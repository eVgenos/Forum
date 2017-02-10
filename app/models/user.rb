class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :password, length: 4..16

  has_many :categories
  has_many :messages
end
