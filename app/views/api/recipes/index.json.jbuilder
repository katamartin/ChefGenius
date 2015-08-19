json.array! @recipes do |recipe|
  json.title recipe.title
  json.author recipe.author.email
  json.body recipe.body
  json.id recipe.id
end
