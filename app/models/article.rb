class Article < ApplicationRecord
  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :body

  def user_can_edit?(user)
    user.present? && (user.owner? || user == self.user)
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
