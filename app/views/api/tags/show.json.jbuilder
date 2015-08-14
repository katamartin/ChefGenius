json.extract! @tag, :label, :id
json.recipes @tag.recipes do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.author recipe.author.email
  json.author_id recipe.author.id
end
