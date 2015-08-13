json.label @tag.label
json.recipes @tag.recipes do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.author recipe.author.email
end
