json.start_idx annotation.start_idx
json.end_idx annotation.end_idx
json.recipe do
  json.title annotation.recipe.title
  json.id annotation.recipe.id
  json.body annotation.recipe.body
end
json.author do
  json.email annotation.author.email
  json.id annotation.author_id
end
