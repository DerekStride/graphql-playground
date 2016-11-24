class Blog < ApplicationRecord
  belongs_to :author
  belongs_to :user

  before_validation :ensure_user_id_is_set

  validates :author, presence: true
  validates :user, presence: true
  validate :author_and_blog_share_user

  private

  def ensure_user_id_is_set
    self.user_id ||= author&.user_id
  end

  def author_and_blog_share_user
    errors.add(:invalid_user, 'user_id must match author#user_id') if author&.user_id != user_id
  end
end
