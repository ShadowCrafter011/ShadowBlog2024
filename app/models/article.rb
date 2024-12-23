class Article < ApplicationRecord
  belongs_to :user

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_rich_text :body

  def slug_candidates
    [ :title, [ :title, :creator_slug ] ] + 10.times.map { |exp| [ :title, Random.rand(10 ** (exp + 5)) ] }
  end

  def creator_slug
    "by-#{user.slug}"
  end

  def user_can_edit?(user)
    user.present? && (user.owner? || user == self.user)
  end

  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
