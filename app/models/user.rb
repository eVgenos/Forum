class User < ApplicationRecord

  enum status: [:notdeleted, :deleted, :banned]

  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "64x64#" },
                    default_url: ':style/missing.jpg'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  after_create :assign_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :messages

  default_scope { order(id: :asc) }

  def assign_role
    add_role :user
  end

  rolify
end
