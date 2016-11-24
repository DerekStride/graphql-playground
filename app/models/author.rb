class Author < ApplicationRecord
  has_many :blogs
  belongs_to :user

  validates :user, presence: true
end
