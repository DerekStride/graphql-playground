class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :authors
  has_many :blogs

  before_create :seed_user_data

  private

  def seed_user_data
    author = authors.build(name: 'Mitch Mulligan')
    author.blogs.build(title: 'Lord of the Fritos Hoops', content: 'The tasties of one rings.')
    author.blogs.build(title: 'Larry Potter', content: 'Ceramics made right.')
    author.blogs.build(title: 'To Kill a Mocking Jay', content: 'The capitol strikes back.')
  end
end
