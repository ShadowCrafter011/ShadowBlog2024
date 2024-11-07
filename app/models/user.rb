class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  has_many :articles

  validates :role, inclusion: { in: %w[user owner writer] }

  def writer?
    role == "owner" || role == "writer"
  end

  def owner?
    role == "owner"
  end
end
