json.array! @recipes do |recipe|
  json.id recipe.id
  json.value recipe.title
  json.tokens recipe.title.split(" ")
end
