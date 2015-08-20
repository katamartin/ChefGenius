json.extract! @tag, :label, :id
json.recipes @tag.recipes do |recipe|
  json.extract! recipe, :id, :title, :author_id
  if recipe.image
    json.image recipe.image, :id, :url
  else
    json.image { json.url Recipe.default_image_url }
  end
  json.author recipe.author.email
end
