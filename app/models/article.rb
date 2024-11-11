class Article < ApplicationRecord
  belongs_to :user

  has_rich_text :body

  def url_title
    title.gsub(" ", "-")
  end

  def user_can_edit?(user)
    user.present? && (user.owner? || user == self.user)
  end
end
