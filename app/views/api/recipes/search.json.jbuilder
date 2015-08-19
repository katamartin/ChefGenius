json.array! @recipes do |recipe|
  json.id recipe.id
  json.name recipe.title
  json.author recipe.author.email
  json.tokens recipe.title.split(" ")
end
