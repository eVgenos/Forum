class User < ApplicationRecord

  after_create :assign_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :messages

  def assign_role
    add_role :user
  end

  rolify
end
