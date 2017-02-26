class Category < ApplicationRecord
  enum status: [:draft, :published]

  validates :title, :body, presence: true

  has_many :messages
  belongs_to :user

  default_scope { order(id: :desc) }

  resourcify
end
