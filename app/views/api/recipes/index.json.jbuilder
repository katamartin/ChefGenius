json.array! @recipes do |recipe|
  json.title recipe.title
  json.author recipe.author.email
  json.body recipe.body
  json.image_url recipe.image_url
  json.id recipe.id
end
