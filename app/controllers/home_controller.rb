class HomeController < ApplicationController
  def index
  end

  def sitemap
    @article_urls = Article.all.map { |article| url_for article }
  end
end
