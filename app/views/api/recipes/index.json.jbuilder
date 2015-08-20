json.array! @recipes do |recipe|
  json.extract! recipe, :title, :body, :id
  json.author recipe.author.email
  if recipe.image
    json.image recipe.image, :id, :url
  else
    json.image do
      json.url Recipe.default_image_url
    end
  end
end
