class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  has_many :articles

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :role, inclusion: { in: %w[user owner writer] }
  validates :username, uniqueness: { case_sensitive: false }, presence: true, length: { in: 3..16 }, format: { with: /\A[\w-]+\z/, message: "Usernname may only contain alphanumerical characters and underscores." }

  def writer?
    role == "owner" || role == "writer"
  end

  def owner?
    role == "owner"
  end

  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end
end
