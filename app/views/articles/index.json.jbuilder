json.array! @articles do |article|
  json.title article.title
  json.body article.body
  json.url url_for(article, format: :json)
end
