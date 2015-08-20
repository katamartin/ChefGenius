json.start_idx annotation.start_idx
json.end_idx annotation.end_idx
json.recipe do
  json.(annotation.recipe, :title, :id, :body)
end
json.author do
  json.email annotation.author.email
  json.id annotation.author_id
end
