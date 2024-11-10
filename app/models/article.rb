class Article < ApplicationRecord
  belongs_to :user

  has_rich_text :body

  def url_title
    title.gsub(" ", "-")
  end
end
