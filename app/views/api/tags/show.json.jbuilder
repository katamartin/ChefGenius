json.label @tag.label
json.recipes @tag.recipes do |recipe|
  json.title recipe.title
  json.author recipe.author.email
end
